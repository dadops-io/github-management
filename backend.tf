terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "simonhoye"

    workspaces {
      name = "github-management"
    }
  }
}