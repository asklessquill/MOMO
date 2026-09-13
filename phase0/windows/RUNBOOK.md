# MOMO System v0.5 — Phase 0 Windows Recovery Runbook

Status: **Phase 0 only / recovery insurance / no Phase 1 authority**

This runbook closes the local-only and non-Git evidence gap identified by `phase0/PHASE0_STATUS.md`. It performs preservation and isolated recovery checks only. It does not merge local work, repair a capability, start a service, run a SandFrog experiment, activate SARU, change current semantic selection, or begin Phase 1.

## Preconditions

Run this on the Windows machine that still contains the pre-v0.5 working state, before deleting or cleaning old worktrees/local artifacts.

Required:

- Git available in PowerShell.
- Read access to the affected local repositories/worktrees.
- Network access to the ten GitHub repositories for the fresh boundary check and mirror capture.
- A genuinely independent destination for the second recovery copy.

The independent destination must be mechanically identifiable as one of:

- a UNC/network path;
- a mapped network drive;
- removable storage;
- externally attached storage whose bus is identified as USB/SD/MMC/iSCSI/Fibre Channel.

A second directory on the same ordinary internal fixed disk does **not** satisfy Phase 0. `Invoke-Phase0Validated.ps1` fails closed when independence cannot be established.

## Exact execution

Obtain these two files from this branch into one local directory:

- `Invoke-Phase0Validated.ps1`
- `Invoke-Phase0LocalRecovery.ps1`

Then run only the validated entrypoint:

```powershell
Set-ExecutionPolicy -Scope Process Bypass -Force

# Replace only this value with the actual independent destination.
$IndependentRoot = '<UNC path or external-drive path>\WorldSE-Phase0-Recovery'

.\Invoke-Phase0Validated.ps1 -IndependentRoot $IndependentRoot
```

Do not substitute a normal internal directory merely to make the check pass.

## What the run captures

The worker performs all of the following without adopting the recovered material:

1. Re-reads all ten remote `main` refs against the fixed Phase 0 baseline.
2. Creates full remote mirrors and `--all` Git bundles, verifies them with `fsck`/bundle verification, restores them into empty bare repositories and verifies the restored repositories.
3. Checks that the fixed accepted MOMO/KIBI/MOMO-Observatory targets are present in the restored history rather than assuming repository HEAD is accepted state.
4. Inventories discovered local repositories, worktrees, refs and stashes; creates verified `--all` bundles for local refs and separately restores those bundles.
5. Captures dirty tracked changes as binary patches and preserves untracked files byte-for-byte with SHA-256 manifests. These remain **unaccepted evidence**.
6. Copies and hash-verifies the known indispensable non-Git state candidates identified by the existing portability evidence: `MSPO/workspace-data`, `MSPO-codex-lab/workspace-data`, and `Saru/.saru-state`.
7. Records only presence metadata for Codex authentication/configuration paths; it does not copy secret values.
8. Corrupts a copy of one recovery bundle and verifies that the corrupted artifact is rejected.
9. Hashes the recovery package, copies it to the independently evidenced destination, and verifies the copied files.

No recovered repository or Product is executed.

## Expected historical local-only items

Prior durable observations are **locators, not current truth**. A fresh run must re-observe them. Items previously seen include:

- KIBI primary checkout: `KIBI.7z`, `KIBI_CONTROLLER_SPEC.tar`.
- KIBI `codex/protocol-conformance-remediation-v1`: modified validator/verification files plus untracked remediation/test material.
- legacy KIJI/MSPO local-only files, a KIJI Lab stash, and ignored/raw `workspace-data`.
- SARU modified/untracked M365/recovery files and `.saru-state`.
- SandFrog local EXP026-B files.
- MOMO local untracked icon material.

Their existence does not make them accepted. Their absence in the fresh run must be explained by evidence; it must not be silently assumed harmless.

## Result and STOP

The worker writes `PHASE0_LOCAL_RESULT.json` to both the local recovery package and the independent copy.

- exit `0` means the **local mechanical recovery checks** passed;
- exit `2` means Phase 0 remains **FAIL / STOP**.

Even exit `0` does **not** authorize Phase 1. Return the resulting `PHASE0_LOCAL_RESULT.json` (and, if any array is non-empty, the relevant manifests/logs) for independent evidence review and the durable G0 receipt.

Until that receipt is reviewed and records `RECOVERY INSURANCE VERIFIED / STOP`, the current state remains:

> **PHASE 0 NOT PASSED / PHASE 1 NOT AUTHORIZED / STOP**
