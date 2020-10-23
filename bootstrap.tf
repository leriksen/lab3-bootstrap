######### TERRAFORM BACKEND ##########
terraform {
  required_version = ">= 0.13, < 0.14"
  required_providers {
    azuredevops = {
      source = "terraform-providers/azuredevops"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "leif-lab3"

    workspaces {
      name = "lab3-bootstrap"
    }
  }
}

######### AZURE DEVOPS SERVICE ##########

# no version constraint - only at v0.0.1
provider "azuredevops" {}

######### RESOURCES ##########
resource "azuredevops_project" "lab3_demo" {
  project_name       = "lab3-demo"
  description        = "Demonstrate some capabilities to Lab3"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"

  features = {
    boards       = "disabled"
    repositories = "enabled"
    pipelines    = "enabled"
    testplans    = "disabled"
    artifacts    = "disabled"
  }
}

resource "azuredevops_git_repository" "lab3_demo_repo" {
  project_id = azuredevops_project.lab3_demo.id
  name       = "leif-lab3-demo"
  initialization {
    init_type = "Clean"
  }
}