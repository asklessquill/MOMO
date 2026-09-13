param(
    [Parameter(Mandatory=$true)][string]$IndependentRoot,
    [string[]]$SearchRoots = @("$env:USERPROFILE\apps", "$env:USERPROFILE\common-ancestor-freeze"),
    [string]$ArchiveRoot = "$env:USERPROFILE\WorldSE-Phase0-Recovery\2026-09-13"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ExpectedMain = [ordered]@{
    MOMO              = 'db1d5f4d08b5cbc1757aeccd03967a91510906ba'
    KIBI              = '19d36fa97a661e15a5cc97eb031134f66bd5311c'
    Kiji              = 'bb66d24ff72c7ca3bed35a0f933c34a4ba55f19f'
    Innu              = '732733d8954158bd72d5836ebe2d7b32bcc28c92'
    Saru              = '57fc3a4105658d03b4d538d1db55b937e2a9a21a'
    'MOMO-Observatory' = '7599f49d574f8f51f7f0ec0057b7935e7e4cf3ab'
    references        = '88498df34eee902c72f9b0e8c53bf91996e49dab'
    Dango             = 'b88e841b813e6d208c7f305fa8b5bbf765cdea67'
    FROG              = '121f25d4a700f17b9e6c9a160517f3a6c90d5b42'
    SandFrog          = 'ea7f25f5abf8886a2d9a9f7d5e6f5cd237ccf232'
}

$AcceptedTargets = [ordered]@{
    MOMO               = @('66b065e55df6c54a6c21b46e2d66a5c6287d86e3')
    KIBI               = @('03b0c7e908967e8c2724c6b5b7decb73f70bca93','233b5260226c41b4ae5fcb123543b39045004ef3')
    'MOMO-Observatory' = @('8eab8ecfeb595b2d9764a666c41c67211ba8a747','70a69732065c71b9fd91c41cbe96048d0290b577')
}

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
        if ($normalized.Equals($a, [System.StringComparison]::OrdinalIgnoreCase) -or
            $normalized.StartsWith($a + '\', [System.StringComparison]::OrdinalIgnoreCase)) {
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

function Invoke-GitNoThrow([string]$wd, [string[]]$args) {
    $old = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $out = & git -C $wd @args 2>&1
    $code = $LASTEXITCODE
    $ErrorActionPreference = $old
    [pscustomobject]@{ Code=$code; Output=@($out) }
}

$independence = Test-IndependentRoot -Path $IndependentRoot -AffectedRoots $SearchRoots -LocalArchiveRoot $ArchiveRoot
$independence | ConvertTo-Json -Depth 4 | Write-Host
if (-not $independence.proven_independent) {
    Write-Error 'PHASE 0 STOP: IndependentRoot is not proven independent. Use a UNC/network destination or externally attached storage that Windows identifies as removable/external.'
    exit 2
}
New-Item -ItemType Directory -Force -Path $IndependentRoot | Out-Null

# Historical durable observations are locators only, but losing them unresolved is not acceptable.
# These were specifically observed as local-only/valuable before Phase 0 and must either still be
# recoverable here or be separately dispositioned with evidence before G0 can pass.
$historicalLocators = [ordered]@{
    'KIBI.7z' = "$env:USERPROFILE\apps\KIBI\KIBI.7z"
    'KIBI_CONTROLLER_SPEC.tar' = "$env:USERPROFILE\apps\KIBI\KIBI_CONTROLLER_SPEC.tar"
    'KIBI dirty remediation worktree' = "$env:USERPROFILE\apps\KIBI-conformance-remediation-v1"
    'KIJI Lab / stash source' = "$env:USERPROFILE\apps\MSPO-codex-lab"
    'KIJI raw workspace-data source' = "$env:USERPROFILE\apps\MSPO\workspace-data"
    'SARU local state source' = "$env:USERPROFILE\apps\Saru\.saru-state"
}
$historicalLocatorFailures = @()
$historicalLocatorRows = @()
foreach ($label in $historicalLocators.Keys) {
    $p = $historicalLocators[$label]
    $present = Test-Path -LiteralPath $p
    $historicalLocatorRows += [pscustomobject]@{ Label=$label; Path=$p; Present=$present }
    if (-not $present) { $historicalLocatorFailures += $label }
}
if ($historicalLocatorFailures.Count -gt 0) {
    Write-Host 'Historical local locator(s) are no longer at the previously observed paths.'
    Write-Host 'The recovery run will still preserve everything currently reachable, but final Phase 0 PASS will be withheld until these are dispositioned with evidence.'
    $historicalLocatorFailures | ForEach-Object { Write-Host " - $_" }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$worker = Join-Path $scriptDir 'Invoke-Phase0LocalRecovery.ps1'
if (-not (Test-Path -LiteralPath $worker -PathType Leaf)) {
    Write-Error "PHASE 0 STOP: worker script missing: $worker"
    exit 2
}

$beforeNames = @()
if (Test-Path -LiteralPath $IndependentRoot) {
    $beforeNames = @(Get-ChildItem -LiteralPath $IndependentRoot -Directory -ErrorAction SilentlyContinue | ForEach-Object Name)
}

& $worker -IndependentRoot $IndependentRoot -SearchRoots $SearchRoots -ArchiveRoot $ArchiveRoot
$workerExit = $LASTEXITCODE

$newIndependentRuns = @(Get-ChildItem -LiteralPath $IndependentRoot -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -notin $beforeNames -and (Test-Path -LiteralPath (Join-Path $_.FullName 'PHASE0_LOCAL_RESULT.json')) } |
    Sort-Object Name -Descending)
if ($newIndependentRuns.Count -eq 0) {
    Write-Error 'PHASE 0 STOP: no new independently copied result package was found.'
    exit 2
}
$indRun = $newIndependentRuns[0].FullName
$runName = $newIndependentRuns[0].Name
$localRun = Join-Path $ArchiveRoot $runName

# Persist the historical-locator observation into both result packages.
$historicalLocatorRows | Export-Csv (Join-Path $indRun 'historical-local-locators.csv') -NoTypeInformation -Encoding UTF8
if (Test-Path -LiteralPath $localRun) {
    $historicalLocatorRows | Export-Csv (Join-Path $localRun 'historical-local-locators.csv') -NoTypeInformation -Encoding UTF8
}

# Directly reconstruct every repository from the INDEPENDENT copy, into a fresh temporary destination.
# No source remote or original working copy is consulted in this verification.
$independentRestoreFailures = @()
$restoreRoot = Join-Path $env:TEMP ("worldse-phase0-independent-restore-" + [guid]::NewGuid())
New-Item -ItemType Directory -Force -Path $restoreRoot | Out-Null
try {
    foreach ($name in $ExpectedMain.Keys) {
        $bundle = Join-Path $indRun ("bundles\$name.bundle")
        $dest = Join-Path $restoreRoot ("$name.git")
        if (-not (Test-Path -LiteralPath $bundle -PathType Leaf)) {
            $independentRestoreFailures += "${name}:bundle_missing"
            continue
        }

        $old = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        & git clone --bare --quiet -- $bundle $dest 2>&1 | Out-Null
        $cloneCode = $LASTEXITCODE
        $ErrorActionPreference = $old
        if ($cloneCode -ne 0) {
            $independentRestoreFailures += "${name}:clone_failed"
            continue
        }

        $fsck = Invoke-GitNoThrow $dest @('fsck','--full','--strict')
        if ($fsck.Code -ne 0) {
            $independentRestoreFailures += "${name}:fsck_failed"
            continue
        }

        $mainCheck = Invoke-GitNoThrow $dest @('cat-file','-e',"$($ExpectedMain[$name])^{commit}")
        if ($mainCheck.Code -ne 0) { $independentRestoreFailures += "${name}:expected_main_missing" }

        if ($AcceptedTargets.Contains($name)) {
            foreach ($sha in $AcceptedTargets[$name]) {
                $acceptedCheck = Invoke-GitNoThrow $dest @('cat-file','-e',"$sha^{commit}")
                if ($acceptedCheck.Code -ne 0) { $independentRestoreFailures += "${name}:accepted_target_missing:$sha" }
            }
        }
    }
} finally {
    if (Test-Path -LiteralPath $restoreRoot) { Remove-Item -LiteralPath $restoreRoot -Recurse -Force }
}

$directRestoreReport = [ordered]@{
    observed_at = (Get-Date).ToString('o')
    source = $indRun
    source_is_independently_evidenced = $independence.proven_independent
    source_independence_evidence = $independence.evidence
    used_source_remotes = $false
    used_original_working_copies = $false
    repositories_tested = @($ExpectedMain.Keys)
    failures = $independentRestoreFailures
    pass = ($independentRestoreFailures.Count -eq 0)
}
$directRestoreReport | ConvertTo-Json -Depth 6 | Set-Content (Join-Path $indRun 'PHASE0_INDEPENDENT_RESTORE.json') -Encoding UTF8
if (Test-Path -LiteralPath $localRun) {
    $directRestoreReport | ConvertTo-Json -Depth 6 | Set-Content (Join-Path $localRun 'PHASE0_INDEPENDENT_RESTORE.json') -Encoding UTF8
}

# Merge wrapper-level evidence into the worker result. A worker PASS alone is not G0 PASS.
$resultPath = Join-Path $indRun 'PHASE0_LOCAL_RESULT.json'
$result = Get-Content -LiteralPath $resultPath -Raw | ConvertFrom-Json
$result | Add-Member -NotePropertyName independent_storage -NotePropertyValue $independence -Force
$result | Add-Member -NotePropertyName historical_locator_failures -NotePropertyValue @($historicalLocatorFailures) -Force
$result | Add-Member -NotePropertyName independent_direct_restore -NotePropertyValue $directRestoreReport -Force
$finalPass = (
    $workerExit -eq 0 -and
    $independence.proven_independent -and
    $historicalLocatorFailures.Count -eq 0 -and
    $independentRestoreFailures.Count -eq 0 -and
    [bool]$result.phase0_pass
)
$result.phase0_pass = $finalPass
$result | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $resultPath -Encoding UTF8
if (Test-Path -LiteralPath $localRun) {
    $result | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $localRun 'PHASE0_LOCAL_RESULT.json') -Encoding UTF8
}

if (-not $finalPass) {
    Write-Host 'PHASE 0 remains FAIL / STOP.'
    if ($workerExit -ne 0) { Write-Host "Worker exit: $workerExit" }
    if ($historicalLocatorFailures.Count) { Write-Host "Unresolved historical locators: $($historicalLocatorFailures.Count)" }
    if ($independentRestoreFailures.Count) { Write-Host "Independent direct-restore failures: $($independentRestoreFailures.Count)" }
    Write-Host "Result: $resultPath"
    exit 2
}

Write-Host 'LOCAL + INDEPENDENT RECOVERY MECHANICS PASS.'
Write-Host 'Do not begin Phase 1 yet.'
Write-Host "Return for independent evidence review: $resultPath"
exit 0
