param(
    [Parameter(Mandatory=$true)][string]$IndependentRoot,
    [string[]]$SearchRoots = @("$env:USERPROFILE\apps", "$env:USERPROFILE\common-ancestor-freeze"),
    [string]$ArchiveRoot = "$env:USERPROFILE\WorldSE-Phase0-Recovery\2026-09-13"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-NormalizedFullPath([string]$Path) {
    if ($Path.StartsWith('\\')) { return $Path.TrimEnd('\') }
    return [System.IO.Path]::GetFullPath($Path).TrimEnd('\')
}

function Test-IndependentRoot([string]$Path, [string[]]$AffectedRoots, [string]$LocalArchiveRoot) {
    $normalized = Get-NormalizedFullPath $Path
    $result = [ordered]@{
        path = $normalized
        proven_independent = $false
        evidence = ''
        drive_type = $null
        bus_type = $null
    }

    foreach ($affected in @($AffectedRoots + $LocalArchiveRoot)) {
        if (-not $affected) { continue }
        $a = Get-NormalizedFullPath $affected
        if ($normalized.StartsWith($a, [System.StringComparison]::OrdinalIgnoreCase)) {
            $result.evidence = "REJECTED: destination is inside affected/local archive root: $a"
            return [pscustomobject]$result
        }
    }

    if ($normalized.StartsWith('\\')) {
        $result.proven_independent = $true
        $result.evidence = 'UNC_NETWORK_PATH'
        return [pscustomobject]$result
    }

    $root = [System.IO.Path]::GetPathRoot($normalized)
    if (-not $root -or $root.Length -lt 2) {
        $result.evidence = 'REJECTED: no drive root could be determined'
        return [pscustomobject]$result
    }

    $drive = $root.Substring(0,2)
    try {
        $logical = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='$drive'" -ErrorAction Stop
        if ($logical) {
            $result.drive_type = [int]$logical.DriveType
            if ($logical.DriveType -eq 4) {
                $result.proven_independent = $true
                $result.evidence = 'MAPPED_NETWORK_DRIVE'
                return [pscustomobject]$result
            }
            if ($logical.DriveType -eq 2) {
                $result.proven_independent = $true
                $result.evidence = 'REMOVABLE_DRIVE'
                return [pscustomobject]$result
            }
        }
    } catch {
        $result.evidence = "Logical-disk inspection failed: $($_.Exception.Message)"
    }

    try {
        $letter = $drive.Substring(0,1)
        $partition = Get-Partition -DriveLetter $letter -ErrorAction Stop | Select-Object -First 1
        if ($partition) {
            $disk = $partition | Get-Disk -ErrorAction Stop
            if ($disk) {
                $result.bus_type = [string]$disk.BusType
                if ([string]$disk.BusType -in @('USB','SD','MMC','iSCSI','Fibre Channel')) {
                    $result.proven_independent = $true
                    $result.evidence = "EXTERNAL_OR_REMOTE_BUS:$($disk.BusType)"
                    return [pscustomobject]$result
                }
            }
        }
    } catch {
        if (-not $result.evidence) { $result.evidence = "Physical-disk inspection failed: $($_.Exception.Message)" }
    }

    if (-not $result.evidence) {
        $result.evidence = 'REJECTED: destination independence was not mechanically established'
    } else {
        $result.evidence = "REJECTED: $($result.evidence); destination independence was not established"
    }
    return [pscustomobject]$result
}

$independence = Test-IndependentRoot -Path $IndependentRoot -AffectedRoots $SearchRoots -LocalArchiveRoot $ArchiveRoot
$independence | ConvertTo-Json -Depth 4 | Write-Host

if (-not $independence.proven_independent) {
    Write-Error 'PHASE 0 STOP: IndependentRoot is not proven independent. Use a UNC/network destination or externally attached storage that Windows identifies as removable/external.'
    exit 2
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$worker = Join-Path $scriptDir 'Invoke-Phase0LocalRecovery.ps1'
if (-not (Test-Path -LiteralPath $worker -PathType Leaf)) {
    Write-Error "PHASE 0 STOP: worker script missing: $worker"
    exit 2
}

& $worker -IndependentRoot $IndependentRoot -SearchRoots $SearchRoots -ArchiveRoot $ArchiveRoot
$exitCode = $LASTEXITCODE
if ($exitCode -ne 0) {
    Write-Host "PHASE 0 remains FAIL / STOP (worker exit $exitCode)."
    exit $exitCode
}

Write-Host 'Phase 0 local evidence collection completed. Do not begin Phase 1 yet.'
Write-Host 'Return PHASE0_LOCAL_RESULT.json for independent review and durable Phase 0 receipt.'
exit 0
