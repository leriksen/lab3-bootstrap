# lab3-bootstrap
bootstrap the devops components of the Lab3 demo - github, azdo etc

## Assumptions

* terraform.io workspace `lab3-bootstrap` already setup in the `leif-lab3` org namespace
* a service principal in Azure that can create Azure DevOps projects, pipelines, variable groups etc

## Provides

* a git repo for the demo project
* an azure devops project with a pipeline and a service principal
