resource "github_repository" "github-management" {
  name        = "github-management"
  description = "Terraform based repository to manage all our GutHub repositories"

  private                = false
  has_issues             = true
  has_wiki               = false
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = true
  auto_init              = false
  delete_branch_on_merge = true
  topics                 = ["config", "terraform"]
}

resource "github_branch_protection" "team_baseline_config" {
  repository     = github_repository.github-management.name
  branch         = "master"

  required_status_checks {
    # require up to date before merging
    strict = true
    contexts = ["atlas/simonhoye/github-management", ]
  }
  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = false
  }
}