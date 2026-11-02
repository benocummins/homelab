# Homelab

My homelab, run like a small production platform: Docker stacks, Ansible, and Terraform-managed networking, changed only through pull requests.

I spent 15+ years in enterprise infrastructure. This repo is where I practice the platform engineering side of it: infrastructure as code, GitOps, and treating a home network with the same discipline as a work one.

## Architecture

```text
                    Internet
                       │
          ┌────────────┴────────────┐
          │   UniFi Cloud Gateway   │  routing, VLANs,
          │   Max                   │  zone-based firewall
          └──┬─────────┬─────────┬──┘
             │         │         │
         ┌───┴──┐  ┌───┴──┐   ┌──┴──────────┐
         │host01│  │host02│   │ Wi-Fi 7 AP  │
         └───┬──┘  └───┬──┘   └─────────────┘
             │         │
   media & workloads   management
   (Docker, NVENC GPU) (Traefik, Dockhand)
```

| Host | Role | Runs |
|---|---|---|
| **host01** | Media and workload | Jellyfin with NVENC transcoding, the *arr stack, SABnzbd behind a Gluetun VPN, Tdarr node, RomM, Beets, ZeroByte backups |
| **host02** | Management | Traefik, Dockhand, Homepage, Tdarr server and node |

Both hosts run Ubuntu Server 24.04 LTS. host02 mounts host01's media and backup volumes over NFS.

## Repository layout

Organized by tool, not by host. Which host runs a stack is a deployment detail, not a folder structure.

```text
.
├── .github/workflows/   # GitHub Actions
├── ansible/             # Host baseline, Docker checks, inventory facts
├── docker/              # One folder per stack: docker-compose.yml + .env.example
│   └── traefik/conf.d/  # One routing file per service
├── terraform/unifi/     # UniFi gateway as code
└── kubernetes/          # Reserved for a future k3s cluster
```

## How it works

**Ingress.** Every service sits behind Traefik at `<service>.grid.<domain>`, with a wildcard Let's Encrypt certificate issued through a Cloudflare DNS-01 challenge. Services use a macvlan network with their own LAN IPs, so Traefik routes through file-based `conf.d` configs instead of Docker labels.

**Container management.** Dockhand manages stacks on both hosts. host01 runs a Hawser agent that connects out to Dockhand, so no inbound ports are opened for management.

**Networking as code.** The gateway's LAN networks are managed by Terraform with the `ubiquiti-community/unifi` provider. The existing hand-built config was imported as-is, one resource at a time, with `terraform plan` showing no changes before anything was committed. Cleanup happens after import, so every change is reviewable and reversible.

**Configuration.** Ansible applies a baseline to every host and verifies Docker is healthy.

## Security model

- **No secrets in Git.** Each stack commits an `.env.example`, and real values live in Dockhand's encrypted environment variables or gitignored files. Terraform state, plan files, and `*.tfvars` are all gitignored, because they can contain secrets in plaintext.
- **Secret scanning in two places.** A gitleaks pre-commit hook runs locally, and GitHub secret scanning with push protection runs on the server.
- **Protected `main`.** Changes land only through pull requests, with signed commits and linear history required.
- **Least privilege.** Terraform uses a dedicated UniFi account limited to the Network application. Cloudflare access uses scoped API tokens, never the global API key.
- **Verified TLS everywhere.** Terraform connects to the gateway over a trusted certificate rather than skipping verification.
- **Deliberately public.** Private RFC 1918 addresses and VLAN IDs are in this repo by choice; they only mean something inside my network. Wi-Fi names, WAN details, and anything personal are kept out.

## Workflow

```text
issue -> branch -> pull request -> squash merge to main
```

Work is planned on the [Homelab project board](https://github.com/users/benocummins/projects/9): ideas, epics, and issues, with labels for the type of work and the area it touches. Every push is mirrored to GitLab as an off-platform backup.

## Roadmap

- [x] Docker stacks in Git with secrets kept out
- [x] Trusted TLS on the gateway for Terraform
- [x] UniFi LAN networks managed by Terraform
- [ ] WAN, Wi-Fi, firewall zones, and policies in Terraform
- [ ] Remote Terraform state
- [ ] CI that validates every pull request (Compose, Terraform, Ansible, secret scanning)
- [ ] Pinned image versions with automated updates
- [ ] Local DNS records so services keep working during an internet outage
- [ ] Monitoring and alerting
- [ ] k3s across both hosts
