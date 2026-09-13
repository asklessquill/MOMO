# Phase 0 Windows collector hotfix — native Git repo probe

Date: 2026-09-13
Scope: Phase 0 recovery insurance only
Status: implementation defect identified; no authority or acceptance criteria changed.

## Observed failure

`Invoke-Phase0LocalRecovery.ps1` probes each top-level candidate with a direct native command while `$ErrorActionPreference = 'Stop'`:

```powershell
$top = (& git -C $candidate.FullName rev-parse --show-toplevel 2>$null)
if ($LASTEXITCODE -ne 0 -or -not $top) { continue }
```

On the observed Windows PowerShell surface, probing an ordinary non-Git directory produced `fatal: not a git repository` as a terminating `NativeCommandError`, aborting the recovery collector before it could continue to other candidates.

This is a collector implementation defect, not a Phase 0 recovery verdict.

## Bounded correction

Use the script's existing `Invoke-Git` helper for the probe so a normal non-repository candidate is represented by a non-zero exit code and skipped without aborting the run:

```powershell
$probe = Invoke-Git $candidate.FullName @('rev-parse','--show-toplevel')
if ($probe.Code -ne 0 -or $probe.Output.Count -eq 0) { continue }
$top = ([string]($probe.Output | Select-Object -First 1)).Trim()
if (-not $top) { continue }
```

No recovery target, accepted target, local-only classification, non-Git preservation rule, independent-copy requirement, PASS condition, STOP, or Phase 1 authority is changed by this correction.

## Current boundary

The preceding run also reported that the prior KIJI Lab / stash locator is no longer present at the previously observed path. That is a separate recovery-evidence matter and remains subject to fail-closed disposition; this hotfix must not convert its absence into PASS.

**Phase 0 remains in progress. Phase 1 remains unauthorized.**
