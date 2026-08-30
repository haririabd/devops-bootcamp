# DevOps Bootcamp 2026 — Infratify

[![DevOps Bootcamp](https://img.shields.io/badge/Bootcamp-Infratify%202026-blue)](https://github.com/haririabd/devops-bootcamp)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This repository serves as a central hub and structured documentation of all hands-on activities, code, configurations, and notes completed during the **DevOps Bootcamp 2026 by Infratify**.

---
## Each students are expected to do the following during each session:

```bash
git checkout -b <sesi>            # cth: aws1, docker1, terraform1
mkdir <sesi>                      # folder artefak sesi
# ... tambah fail output, nota, Dockerfile, .tf ...
git add .
git commit -m "<Sesi>: <ringkasan>"
git push -u origin <sesi>
gh pr create --fill
gh pr merge --squash --delete-branch
```

## 📌 Repository Structure

```text
.
├── 01-devops/         # DevOps philosophy, culture, and toolchain maps
├── 02-linux/          # Filesystem navigation, permissions, process control, SSH
├── 03-git/            # Local Git operations, branching, merging, rebase
├── 04-github/         # Remote repos, PRs, code reviews, GitHub Pages
├── 05-aws/            # IAM, EC2, S3, VPC, route tables, ECR integration
├── 06-cloudflare/     # DNS, Cloudflare Pages, Workers, Tunnels, Access
├── 07-docker/         # Containers, Dockerfiles, Compose, multi-stage, healthchecks
├── 08-cicd/           # GitHub Actions, matrix builds, secrets, GHCR deployment
├── 09-terraform/      # IaC, HCL, remote S3 state, locking, modules, multi-provider
├── 10-ansible/        # Inventories, playbooks, roles, handlers, Ansible Vault
├── 11-prometheus/     # Prometheus setup via Ansible, scraping configs, PromQL basics
└── 12-grafana/        # Grafana deployment, dashboards, Slack/Discord alerts
```

---

## 🛠 Syllabus & Modules Breakdown

| Module | Topic | Key Concepts & Deliverables |
| :--- | :--- | :--- |
| **DevOps 1** | Introduction to DevOps | DevOps philosophy, culture vs tooling, why DevOps exists |
| **DevOps 2** | Tooling & Roadmap | Toolchain map breakdown & technology landscape |
| **Linux 1** | Fundamentals | Filesystem navigation, viewing files, environment variables |
| **Linux 2** | User & Access Control | File permissions, user management, groups, `sudo` access |
| **Linux 3** | Process & Streams | Process management, signals, IO redirection, piping (`\|`) |
| **Linux 4** | Networking & Security | Basic networking, SSH configuration, key pair authentication |
| **Git 1** | Local Workflow | `git init`, tracking (`add`), commit workflows, `log`, `diff` |
| **Git 2** | Branching Strategy | Branch management, merging strategies, resolving conflicts, rebase intro |
| **GitHub 1** | Collaboration | Remote repositories, push/pull, Pull Requests (PRs), issue tracking |
| **GitHub 2** | Advanced GitHub | Repository forks, code reviews, GitHub Pages deployment |
| **AWS 1** | Core Account & Identity | AWS Management Console vs CLI, IAM users, policies, roles |
| **AWS 2** | Core Compute & Storage | Provisioning EC2 instances, S3 bucket storage, Security Groups |
| **AWS 3** | Cloud Networking | VPC architecture, public/private subnets, route tables, internet gateways |
| **AWS 4** | Container Registry | AWS ECR setup, IAM for ECR, pushing & pulling images via EC2 |
| **Cloudflare 1** | Edge Services | Account setup, DNS management, static hosting via Cloudflare Pages |
| **Cloudflare 2** | Edge Computing & Zero Trust | Serverless Workers, Cloudflare Tunnels, Access policy controls |
| **Docker 1** | Container Basics | Containers vs VMs, core concepts, running first container |
| **Docker 2** | Image Creation | Writing `Dockerfile`, building images, tagging, multi-stage builds |
| **Docker 3** | Orchestration Basics | Data volumes, custom networks, Docker Compose, pushing to ECR |
| **Docker 4** | Production Practices | Container healthchecks, production patterns, intro to Kubernetes (K8s) |
| **CI/CD 1** | Automation Intro | CI/CD concepts, writing first GitHub Actions workflow, deploying to Pages |
| **CI/CD 2** | Pipelines & Artifacts | Build + test automation, matrix builds, handling pipeline artifacts |
| **CI/CD 3** | Security & Governance | Handling GitHub Secrets, environments, manual approval gates |
| **CI/CD 4** | Container Deployment | Building & pushing images to GHCR, automated GHCR deployment |
| **Terraform 1** | Infrastructure as Code | IaC fundamentals, HCL syntax, provider configuration, `terraform apply` |
| **Terraform 2** | State & Variables | Managing Terraform state, variables, outputs, intro to modules |
| **Terraform 3** | Remote Backend | Remote state storage via S3, DynamoDB state locking, workspaces |
| **Terraform 4** | Advanced Provisioning | Custom modules, Cloudflare provider setup, multi-provider deployment |
| **Ansible 1** | Configuration Management | Host inventories, ad-hoc execution commands, writing initial playbooks |
| **Ansible 2** | Scalable Automation | Structuring Ansible Roles, event handlers, variables, Ansible Vault encryption |
| **Prometheus** | Monitoring | Deploying Prometheus via Ansible, target scraping, PromQL query basics |
| **Grafana** | Visualization & Alerting | Deploying Grafana via Ansible, dashboard creation, Slack & Discord alerts |

---

## 🚀 Getting Started

To replicate or review the exercises locally:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/haririabd/devops-bootcamp.git
   cd devops-bootcamp
   ```

2. **Navigate to the target module directory:**
   ```bash
   cd 07-docker/
   ```

3. **Follow individual module instructions:**
   Each module folder contains specific exercise notes, code samples, `Dockerfile`s, or Terraform configuration files with step-by-step guidance.

---

## 📄 License

This repository is maintained for educational purposes as part of the **Infratify DevOps Bootcamp 2026**.