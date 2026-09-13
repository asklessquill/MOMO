param(
    [string[]]$SearchRoots = @("$env:USERPROFILE\apps", "$env:USERPROFILE\common-ancestor-freeze"),
    [string]$ArchiveRoot = "$env:USERPROFILE\WorldSE-Phase0-Recovery\2026-09-13",
    [Parameter(Mandatory=$true)][string]$IndependentRoot
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$ExpectedMain = [ordered]@{
    MOMO             = 'db1d5f4d08b5cbc1757aeccd03967a91510906ba'
    KIBI             = '19d36fa97a661e15a5cc97eb031134f66bd5311c'
    Kiji             = 'bb66d24ff72c7ca3bed35a0f933c34a4ba55f19f'
    Innu             = '732733d8954158bd72d5836ebe2d7b32bcc28c92'
    Saru             = '57fc3a4105658d03b4d538d1db55b937e2a9a21a'
    'MOMO-Observatory'= '7599f49d574f8f51f7f0ec0057b7935e7e4cf3ab'
    references       = '88498df34eee902c72f9b0e8c53bf91996e49dab'
    Dango            = 'b88e841b813e6d208c7f305fa8b5bbf765cdea67'
    FROG             = '121f25d4a700f17b9e6c9a160517f3a6c90d5b42'
    SandFrog         = 'ea7f25f5abf8886a2d9a9f7d5e6f5cd237ccf232'
}

$AcceptedTargets = [ordered]@{
    MOMO              = @('66b065e55df6c54a6c21b46e2d66a5c6287d86e3')
    KIBI              = @('03b0c7e908967e8c2724c6b5b7decb73f70bca93','233b5260226c41b4ae5fcb123543b39045004ef3')
    'MOMO-Observatory'= @('8eab8ecfeb595b2d9764a666c41c67211ba8a747','70a69732065c71b9fd91c41cbe96048d0290b577')
}

$RepoUrls = [ordered]@{}
foreach ($name in $ExpectedMain.Keys) { $RepoUrls[$name] = "https://github.com/asklessquill/$name.git" }

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$runRoot = Join-Path $ArchiveRoot $stamp
$indRoot = Join-Path $IndependentRoot $stamp
$dirs = @('manifests','mirrors','bundles','restore-test','local-only','non-git','logs')
foreach ($d in $dirs) { New-Item -ItemType Directory -Force -Path (Join-Path $runRoot $d) | Out-Null }

function Invoke-Git([string]$wd, [string[]]$args) {
    $old = $ErrorActionPreference; $ErrorActionPreference = 'Continue'
    $out = & git -C $wd @args 2>&1
    $code = $LASTEXITCODE
    $ErrorActionPreference = $old
    [pscustomobject]@{ Code=$code; Output=@($out) }
}

function Safe-Name([string]$s) { return ($s -replace '[^A-Za-z0-9._-]','_') }

$summary = [ordered]@{
    observed_at = (Get-Date).ToString('o')
    phase = 0
    main_drift = @()
    repo_failures = @()
    accepted_target_failures = @()
    local_preservation_failures = @()
    non_git_failures = @()
    independent_copy_failures = @()
    negative_test = 'NOT_RUN'
    phase0_pass = $false
}

# 1. Fresh remote boundary check.
$remoteRows = @()
foreach ($name in $RepoUrls.Keys) {
    $r = & git ls-remote $RepoUrls[$name] refs/heads/main 2>$null
    $sha = if ($LASTEXITCODE -eq 0 -and $r) { ($r -split "`t")[0] } else { '' }
    $match = ($sha -eq $ExpectedMain[$name])
    $remoteRows += [pscustomobject]@{ Repository=$name; Main=$sha; Expected=$ExpectedMain[$name]; Match=$match }
    if (-not $match) { $summary.main_drift += $name }
}
$remoteRows | Export-Csv (Join-Path $runRoot 'manifests\remote-main.csv') -NoTypeInformation -Encoding UTF8

# 2. Independent full-history mirrors -> bundles -> isolated restores.
foreach ($name in $RepoUrls.Keys) {
    $mirror = Join-Path $runRoot ("mirrors\$name.git")
    $bundle = Join-Path $runRoot ("bundles\$name.bundle")
    $restore = Join-Path $runRoot ("restore-test\$name.git")

    $old = $ErrorActionPreference; $ErrorActionPreference='Continue'
    & git clone --mirror --quiet -- $RepoUrls[$name] $mirror 2>&1 | Out-File (Join-Path $runRoot "logs\$name-clone.txt")
    $cloneCode = $LASTEXITCODE
    $ErrorActionPreference=$old
    if ($cloneCode -ne 0) { $summary.repo_failures += "$name:mirror_clone"; continue }

    $fsck = Invoke-Git $mirror @('fsck','--full','--strict')
    if ($fsck.Code -ne 0) { $summary.repo_failures += "$name:mirror_fsck"; continue }

    $b = Invoke-Git $mirror @('bundle','create',$bundle,'--all')
    if ($b.Code -ne 0) { $summary.repo_failures += "$name:bundle_create"; continue }

    $v = & git bundle verify $bundle 2>&1
    if ($LASTEXITCODE -ne 0) { $summary.repo_failures += "$name:bundle_verify"; continue }

    $old = $ErrorActionPreference; $ErrorActionPreference='Continue'
    & git clone --bare --quiet -- $bundle $restore 2>&1 | Out-File (Join-Path $runRoot "logs\$name-restore.txt")
    $restoreCode = $LASTEXITCODE
    $ErrorActionPreference=$old
    if ($restoreCode -ne 0) { $summary.repo_failures += "$name:isolated_restore"; continue }

    $rf = Invoke-Git $restore @('fsck','--full','--strict')
    if ($rf.Code -ne 0) { $summary.repo_failures += "$name:restored_fsck"; continue }

    if ($AcceptedTargets.Contains($name)) {
        foreach ($sha in $AcceptedTargets[$name]) {
            $chk = Invoke-Git $restore @('cat-file','-e',"$sha^{commit}")
            if ($chk.Code -ne 0) { $summary.accepted_target_failures += "$name:$sha" }
        }
    }
}

# 3. Discover local repositories/worktrees and preserve dirty/untracked state without adopting it.
$seenTop = @{}
$localRows = @()
foreach ($root in $SearchRoots) {
    if (-not (Test-Path $root)) { continue }
    $candidates = @((Get-Item $root)) + @(Get-ChildItem $root -Directory -Force -ErrorAction SilentlyContinue)
    foreach ($candidate in $candidates) {
        $top = (& git -C $candidate.FullName rev-parse --show-toplevel 2>$null)
        if ($LASTEXITCODE -ne 0 -or -not $top) { continue }
        $top = ($top | Select-Object -First 1).Trim()
        if ($seenTop.ContainsKey($top)) { continue }
        $seenTop[$top] = $true

        $origin = (& git -C $top config --get remote.origin.url 2>$null | Select-Object -First 1)
        $head = (& git -C $top rev-parse HEAD 2>$null | Select-Object -First 1)
        $branch = (& git -C $top branch --show-current 2>$null | Select-Object -First 1)
        $repoSlug = Safe-Name ((Split-Path $top -Leaf) + '-' + $head.Substring(0,[Math]::Min(8,$head.Length)))
        $repoOut = Join-Path $runRoot ("local-only\$repoSlug")
        New-Item -ItemType Directory -Force -Path $repoOut | Out-Null

        & git -C $top worktree list --porcelain | Out-File (Join-Path $repoOut 'worktrees.txt') -Encoding utf8
        & git -C $top branch -avv | Out-File (Join-Path $repoOut 'branches.txt') -Encoding utf8
        & git -C $top stash list --format='%H %gd %s' | Out-File (Join-Path $repoOut 'stashes.txt') -Encoding utf8
        & git -C $top show-ref | Out-File (Join-Path $repoOut 'refs.txt') -Encoding utf8

        $wts = @(& git -C $top worktree list --porcelain | Select-String '^worktree ' | ForEach-Object { $_.Line.Substring(9) })
        foreach ($wt in $wts) {
            $wtName = Safe-Name (Split-Path $wt -Leaf)
            $wtOut = Join-Path $repoOut $wtName
            New-Item -ItemType Directory -Force -Path $wtOut | Out-Null
            & git -C $wt status --porcelain=v2 --branch -uall | Out-File (Join-Path $wtOut 'status.txt') -Encoding utf8
            & git -C $wt diff --binary HEAD | Out-File (Join-Path $wtOut 'tracked.patch') -Encoding utf8
            & git -C $wt diff --cached --binary | Out-File (Join-Path $wtOut 'staged.patch') -Encoding utf8

            $untracked = @(& git -C $wt ls-files --others --exclude-standard)
            $uRows = @()
            foreach ($rel in $untracked) {
                $src = Join-Path $wt $rel
                if (-not (Test-Path -LiteralPath $src -PathType Leaf)) { continue }
                $dst = Join-Path $wtOut (Join-Path 'untracked' $rel)
                New-Item -ItemType Directory -Force -Path (Split-Path $dst -Parent) | Out-Null
                Copy-Item -LiteralPath $src -Destination $dst -Force
                $h = Get-FileHash -Algorithm SHA256 -LiteralPath $dst
                $uRows += [pscustomobject]@{ Path=$rel; Length=(Get-Item -LiteralPath $dst).Length; SHA256=$h.Hash }
            }
            $uRows | Export-Csv (Join-Path $wtOut 'untracked-manifest.csv') -NoTypeInformation -Encoding UTF8
        }
        $localRows += [pscustomobject]@{ TopLevel=$top; Origin=$origin; Head=$head; Branch=$branch; WorktreeCount=$wts.Count }
    }
}
$localRows | Export-Csv (Join-Path $runRoot 'manifests\local-repositories.csv') -NoTypeInformation -Encoding UTF8

# 4. Preserve known indispensable/non-Git state candidates from prior portability evidence.
$nonGitCandidates = [ordered]@{
    'MSPO-workspace-data' = "$env:USERPROFILE\apps\MSPO\workspace-data"
    'KIJI-lab-workspace-data' = "$env:USERPROFILE\apps\MSPO-codex-lab\workspace-data"
    'SARU-state' = "$env:USERPROFILE\apps\Saru\.saru-state"
}
$nonGitRows = @()
foreach ($label in $nonGitCandidates.Keys) {
    $src = $nonGitCandidates[$label]
    if (-not (Test-Path $src)) {
        $nonGitRows += [pscustomobject]@{ Label=$label; Source=$src; Present=$false; Files=0; Bytes=0; Restored=$false }
        continue
    }
    $dst = Join-Path $runRoot ("non-git\$label")
    New-Item -ItemType Directory -Force -Path $dst | Out-Null
    & robocopy $src $dst /E /COPY:DAT /DCOPY:T /R:1 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
    if ($LASTEXITCODE -ge 8) { $summary.non_git_failures += "$label:copy"; continue }

    $files = @(Get-ChildItem $dst -File -Recurse -Force)
    $manifest = foreach ($f in $files) {
        $rel = $f.FullName.Substring($dst.Length).TrimStart('\')
        [pscustomobject]@{ Path=$rel; Length=$f.Length; SHA256=(Get-FileHash -Algorithm SHA256 -LiteralPath $f.FullName).Hash }
    }
    $manifest | Export-Csv (Join-Path $runRoot "manifests\$label.csv") -NoTypeInformation -Encoding UTF8

    $restoreDst = Join-Path $runRoot ("restore-test\non-git\$label")
    New-Item -ItemType Directory -Force -Path $restoreDst | Out-Null
    & robocopy $dst $restoreDst /E /COPY:DAT /DCOPY:T /R:1 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
    if ($LASTEXITCODE -ge 8) { $summary.non_git_failures += "$label:restore"; continue }
    $restored = @(Get-ChildItem $restoreDst -File -Recurse -Force)
    $ok = ($restored.Count -eq $files.Count)
    if ($ok) {
        foreach ($f in $restored) {
            $rel = $f.FullName.Substring($restoreDst.Length).TrimStart('\')
            $orig = Join-Path $dst $rel
            if ((Get-FileHash $f.FullName -Algorithm SHA256).Hash -ne (Get-FileHash $orig -Algorithm SHA256).Hash) { $ok=$false; break }
        }
    }
    if (-not $ok) { $summary.non_git_failures += "$label:hash_mismatch" }
    $nonGitRows += [pscustomobject]@{ Label=$label; Source=$src; Present=$true; Files=$files.Count; Bytes=($files | Measure-Object Length -Sum).Sum; Restored=$ok }
}
$nonGitRows | Export-Csv (Join-Path $runRoot 'manifests\non-git-state.csv') -NoTypeInformation -Encoding UTF8

# 5. Credential/binding metadata only. Never copy secret values.
$bindingRows = @(
    [pscustomobject]@{ Item='Codex auth'; Path="$env:USERPROFILE\.codex\auth.json"; Present=(Test-Path "$env:USERPROFILE\.codex\auth.json"); ContentCopied=$false },
    [pscustomobject]@{ Item='Codex config'; Path="$env:USERPROFILE\.codex\config.toml"; Present=(Test-Path "$env:USERPROFILE\.codex\config.toml"); ContentCopied=$false }
)
$bindingRows | Export-Csv (Join-Path $runRoot 'manifests\binding-metadata.csv') -NoTypeInformation -Encoding UTF8

# 6. Negative corruption test: a corrupted bundle must be rejected.
$probe = Join-Path $runRoot 'bundles\MOMO.bundle'
if (Test-Path $probe) {
    $bad = Join-Path $runRoot 'restore-test\MOMO-corrupt.bundle'
    Copy-Item $probe $bad -Force
    $bytes = [System.IO.File]::ReadAllBytes($bad)
    if ($bytes.Length -gt 128) { $bytes[128] = $bytes[128] -bxor 0xFF; [System.IO.File]::WriteAllBytes($bad,$bytes) }
    & git bundle verify $bad *> $null
    $summary.negative_test = if ($LASTEXITCODE -ne 0) { 'PASS_REJECTED_CORRUPT_ARTIFACT' } else { 'FAIL_CORRUPT_ARTIFACT_ACCEPTED' }
    if ($LASTEXITCODE -eq 0) { $summary.repo_failures += 'negative_corruption_test' }
}

# 7. Hash protected package, copy to independent destination, then verify every copied file.
$protectedFiles = @(Get-ChildItem $runRoot -File -Recurse -Force)
$hashRows = foreach ($f in $protectedFiles) {
    $rel = $f.FullName.Substring($runRoot.Length).TrimStart('\')
    [pscustomobject]@{ Path=$rel; Length=$f.Length; SHA256=(Get-FileHash -Algorithm SHA256 -LiteralPath $f.FullName).Hash }
}
$hashRows | Export-Csv (Join-Path $runRoot 'manifests\package-sha256.csv') -NoTypeInformation -Encoding UTF8

New-Item -ItemType Directory -Force -Path $indRoot | Out-Null
& robocopy $runRoot $indRoot /E /COPY:DAT /DCOPY:T /R:1 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
if ($LASTEXITCODE -ge 8) { $summary.independent_copy_failures += 'robocopy' }
foreach ($row in $hashRows) {
    $p = Join-Path $indRoot $row.Path
    if (-not (Test-Path -LiteralPath $p)) { $summary.independent_copy_failures += "missing:$($row.Path)"; continue }
    if ((Get-FileHash -Algorithm SHA256 -LiteralPath $p).Hash -ne $row.SHA256) { $summary.independent_copy_failures += "hash:$($row.Path)" }
}

# 8. Gate. Historical/local material is preserved as evidence, never accepted by this script.
$summary.phase0_pass = (
    $summary.main_drift.Count -eq 0 -and
    $summary.repo_failures.Count -eq 0 -and
    $summary.accepted_target_failures.Count -eq 0 -and
    $summary.local_preservation_failures.Count -eq 0 -and
    $summary.non_git_failures.Count -eq 0 -and
    $summary.independent_copy_failures.Count -eq 0 -and
    $summary.negative_test -eq 'PASS_REJECTED_CORRUPT_ARTIFACT'
)

$summary | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $runRoot 'PHASE0_LOCAL_RESULT.json') -Encoding UTF8
$summary | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $indRoot 'PHASE0_LOCAL_RESULT.json') -Encoding UTF8

Write-Host "`nPhase 0 local recovery package: $runRoot"
Write-Host "Independent copy:             $indRoot"
if ($summary.phase0_pass) {
    Write-Host 'LOCAL RECOVERY / ISOLATED RESTORE CHECKS PASS'
    exit 0
} else {
    Write-Host 'PHASE 0 LOCAL CHECKS INCOMPLETE OR FAILED — STOP'
    $summary | ConvertTo-Json -Depth 8 | Write-Host
    exit 2
}
