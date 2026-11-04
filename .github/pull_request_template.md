## Summary
<!-- What does this PR change, in 1-3 sentences? -->

## Related Issue
<!-- "Closes #123" auto-closes the issue on merge. Use "Relates to #123" if it doesn't finish it. -->
Closes #

## Changes
<!-- Bullet list of what changed, grouped by file or area. Describe changes, never paste secret values. -->
-

## Area
- [ ] Terraform
- [ ] Docker / Compose
- [ ] Traefik routing
- [ ] Ansible
- [ ] GitHub Actions / CI
- [ ] Docs only

## Type of Change
- [ ] Bug fix
- [ ] New feature / new service
- [ ] Config change to an existing service
- [ ] Refactor / cleanup (no behavior change)
- [ ] Breaking change (downtime, renamed resources, or Terraform destroy/replace)

## Validation
<!-- How do you know this works? Remove lines that don't apply. -->
<!-- Terraform: summarize the plan counts, e.g. "0 to add, 1 to change, 0 to destroy". Never paste raw plan output. -->
<!-- Docker: `docker compose config` passes; container healthy after deploy. -->
<!-- Ansible: `--check --diff` run against the target host. -->
-

## Deployment & Rollback
<!-- How does this reach prod, and how do you undo it if it breaks? -->
- **Deploy:**
- **Rollback:**

## Security Checklist
<!-- This repo is PUBLIC. -->
- [ ] No secrets, tokens, or passwords in code, commits, or this description
- [ ] No SSIDs, WAN/public IPs, or personal info (those belong in gitignored `*.tfvars` / `.env`)
- [ ] New config values have a matching entry in `.env.example` / `*.tfvars.example`
- [ ] gitleaks pre-commit hook ran (not skipped with `--no-verify`)

## Docs
- [ ] README / CLAUDE.md updated, or not needed
