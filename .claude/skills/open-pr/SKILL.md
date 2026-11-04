---
name: open-pr
description: Review the current branch against main, draft a PR title and body from the repo's PR template, and open the PR after approval
disable-model-invocation: true
allowed-tools: Bash(git status:*), Bash(git log:*), Bash(git diff:*), Bash(git branch:*), Bash(git rev-parse:*), Bash(gh pr list:*), Bash(gh pr view:*), Bash(gh issue view:*), Bash(gh label list:*), Read
---

# Open a Pull Request

Your job is to write the PR, not the code. Do not edit, stage, or commit any files.
The user wants to see what you find and approve the PR before anything is published.

## 1. Pre-flight checks (stop and report if any fail)

- `git branch --show-current`: if the branch is `main`, stop. PRs come from feature branches.
- `git status --porcelain`: if there are uncommitted or untracked changes, list them and ask
  whether to continue. Don't commit them yourself.
- `gh pr list --head <branch>`: if a PR already exists for this branch, show its URL and stop.
- `git rev-parse --abbrev-ref --symbolic-full-name @{u}`: if the branch has no upstream or is
  ahead of it, tell the user it needs to be pushed. Don't push without explicit approval.

## 2. Gather context (compare against main, not just the last commit)

- `git log main..HEAD --oneline` lists the commits in this PR.
- `git diff main...HEAD --stat` lists the files touched.
- `git diff main...HEAD` shows the actual changes. Read them so the description is accurate.
- Look for an issue number in the branch name, commit messages, or conversation. If you find
  one, run `gh issue view <n>` to get the "why". If you don't, ask the user which issue this closes.
- `gh label list` shows the available labels. The repo uses type labels and area labels.

## 3. Draft the PR

**Title:** imperative mood, under ~70 chars, no trailing period (e.g. "Manage UniFi WAN1 with Terraform").

**Body:** read `.github/pull_request_template.md` and fill it in, keeping its headings in order:
- **Summary / Changes:** what changed and why, grouped by area/file. Be specific, but summarize;
  don't paste the diff.
- **Related Issue:** `Closes #<n>` if this finishes the issue, `Relates to #<n>` if it doesn't.
- **Area / Type of Change:** tick only the boxes the diff clearly supports. Tick "Breaking change"
  if anything causes downtime, renames resources, or makes Terraform destroy/replace something.
- **Validation / Deployment & Rollback:** only what you can verify from the repo or conversation.
  If you don't know, leave a `TODO:` for the user rather than inventing steps.
- **Security Checklist / Docs:** leave these boxes UNTICKED. They are the user's own attestation.
- Remove the template's `<!-- -->` instruction comments.
- End with the attribution line: `🤖 Generated with [Claude Code](https://claude.com/claude-code)`

## 4. Security gate (this repo is PUBLIC)

Before showing the draft, check the title and body. They must NOT contain:
- Secrets, tokens, API keys, passwords, Wi-Fi passphrases
- Values from `*.tfvars`, `.env`, Terraform state, or raw `terraform plan` output
- SSIDs, WAN/public IP addresses, ISP account details, or personal info

Describe *what* changed (e.g. "WAN1 DNS settings now managed in code"), never the values.
If the **diff itself** appears to contain a secret or one of the above, STOP. Don't draft
the PR. Tell the user which file and line, and explain why it's a problem.

## 5. Approval, then create

Show the user the proposed title, labels, base branch (`main`), and full body. Ask:
"Open this PR?" They may edit it, or ask for a draft PR.

Only after an explicit yes:
1. Write the body to a temp file in the session's scratchpad (avoids shell quoting problems).
2. Run `gh pr create --base main --title "<title>" --body-file <file> --label <labels>`
   (add `--draft` if requested).
3. Report the PR URL.
