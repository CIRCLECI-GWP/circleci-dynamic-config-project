terraform {

  required_version = ">= 0.13"

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.25.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }

  backend "remote" {
    organization = "CircleCI-Author-Program"
    workspaces {
      name = "deploy-iac-do"
    }
  }
}

data "digitalocean_kubernetes_cluster" "do_cluster" {
  name = var.cluster_name
}


provider "kubernetes" {
  host                   = var.k8s_cluster_endpoint
  token                  = var.k8s_cluster_token
  cluster_ca_certificate = var.k8s_cluster_ca_certificate
}
