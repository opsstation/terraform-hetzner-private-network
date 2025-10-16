# 🛰️ Terraform-Hetzner-Private-Network

[![OpsStation](https://img.shields.io/badge/Made%20by-OpsStation-blue?style=flat-square&logo=terraform)](https://www.opsstation.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.13%2B-purple.svg?logo=terraform)](#)
[![CI](https://github.com/OpsStation/terraform-hetzner-private-network/actions/workflows/ci.yml/badge.svg)](https://github.com/OpsStation/terraform-hetzner-private-network/actions/workflows/ci.yml)

> 🧩 **A Terraform module by [OpsStation](https://www.opsstation.com)**  
> to provision and manage **Private Networks in Hetzner Cloud**,  
> with consistent **naming, labels, and resource tagging** conventions.

---

## 🏢 About OpsStation

**OpsStation** delivers **Cloud & DevOps excellence** for modern teams:
- 🚀 **Infrastructure Automation** with Terraform, Ansible & Kubernetes
- 💰 **Cost Optimization** via scaling & right-sizing
- 🛡️ **Security & Compliance** baked into CI/CD pipelines
- ⚙️ **Fully Managed Operations** across AWS, Azure, GCP & Hetzner

> 💡 Need enterprise-grade DevOps automation?  
> 👉 Visit [**www.opsstation.com**](https://www.opsstation.com) or email **hello@opsstation.com**

---

## 🌟 Features

- ✅ Creates **Hetzner Private Network** with optional subnets
- ✅ Auto-generates **consistent resource names and labels**
- ✅ Supports multi-zone configuration (`fsn1`, `nbg1`, `hel1`)
- ✅ Integrates with other OpsStation Hetzner modules (servers, firewalls, etc.)
- ✅ Lightweight, reusable, and cloud-safe

---

## ⚙️ Usage Example

```hcl
module "private_network" {
  source      = "opsstation/private-network/hetzner"
  version     = "1.0.0"

  name        = "network"
  environment = "demo"

  subnets = {
    net1 = {
      ip_range = "10.10.0.0/24"
      type     = "cloud"
    }

    net2 = {
      ip_range = "10.10.1.0/24"
      type     = "cloud"
    }
  }

  routes = {
    route1 = {
      destination = "0.0.0.0/0"
      gateway     = "10.10.0.2"
    }
  }
}

