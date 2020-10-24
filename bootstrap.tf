######### TERRAFORM BACKEND ##########
terraform {
  required_version = ">= 0.13, < 0.14"
  required_providers {
    azuredevops = {
      source = "terraform-providers/azuredevops"
    }
    github = { version = "~> 3.0" }
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

######### GITHUB ##########
provider "github" {}

######### RESOURCES ##########
resource "azuredevops_project" "lab3_demo" {
  project_name       = "lab3-demo"
  description        = "Demonstrate some capabilities to Lab3"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
  features = {
    boards       = "disabled"
    repositories = "disabled"
    pipelines    = "enabled"
    testplans    = "disabled"
    artifacts    = "disabled"
  }
}

resource "github_repository" "lab3_demo_repo" {
  name               = "leif-lab3-demo"
  description        = "demo of one-code/many-workspaces pattern"
  visibility         = "public"
  gitignore_template = "Terraform"
  license_template   = "bsd-3-clause"
  auto_init          = true
  has_issues         = true
}