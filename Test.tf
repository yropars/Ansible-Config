variable "project_id" {
  type        = string
  description = "Your project ID."
}

terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone   = "fr-par-1"
  region = "fr-par"
}

resource "scaleway_instance_ip" "public_ip" {
  project_id = var.project_id
}
resource "scaleway_instance_ip" "public_ip_backup" {
  project_id = var.project_id
}

resource "scaleway_instance_volume" "data" {
  project_id = var.project_id
  size_in_gb = 30
  type       = "l_ssd"
}

resource "scaleway_instance_volume" "data_backup" {
  project_id = var.project_id
  size_in_gb = 10
  type       = "l_ssd"
}

resource "scaleway_instance_security_group" "www" {
  project_id              = var.project_id
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
    ip     = "212.47.225.64"
  }

  inbound_rule {
    action = "accept"
    port   = "80"
  }

  inbound_rule {
    action = "accept"
    port   = "443"
  }
}

resource "scaleway_instance_server" "web" {
  project_id = var.project_id
  type       = "DEV1-L"
  image      = "ubuntu_focal"

  tags = ["front", "web"]

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [scaleway_instance_volume.data.id]

  root_volume {
    # The local storage of a DEV1-L instance is 80 GB, subtract 30 GB from the additional l_ssd volume, then the root volume needs to be 50 GB.
    size_in_gb = 50
  }

  security_group_id = scaleway_instance_security_group.www.id
}
