terraform {
  backend "remote" {
    organization = "shubhadeep"
    
    workspaces {
      #prefix = ""
      #name = var.workspace
      name = "infra-terraform"
    }
  }
}
