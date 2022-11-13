# // Private repository credentials
# resource "argocd_repository_credentials" "private" {
#   url             = "git@private-git-repository.local"
#   username        = "git"
#   ssh_private_key = "-----BEGIN OPENSSH PRIVATE KEY-----\nfoo\nbar\n-----END OPENSSH PRIVATE KEY-----"
# }

# // Uses previously defined argocd_repository_credentials credentials
# resource "argocd_repository" "private" {
#   repo = "git@private-git-repository.local:somerepo.git"
# }

resource "argocd_repository" "repo" {
  repo            = "git@github.com:HadadAvsha/Project-Gitops.git"
  username        = "AvshaH"
  ssh_private_key = file("~/.ssh/lior") #"-----BEGIN OPENSSH PRIVATE KEY-----\nfoo\nbar\n-----END OPENSSH PRIVATE KEY-----"
#   insecure        = true
}