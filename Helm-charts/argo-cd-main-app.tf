# resource "argocd_application" "my-app" {
#   metadata {
#     name      = "my-app"
#     namespace = "default"
#     labels = {
#       test = "true"
#     }
#   }

# #   wait = true

#   spec {
#     source {
#       repo_url        = "git@github.com:HadadAvsha/Project-Gitops.git"
#       path            = "infra-apps"
#     #   chart           = "app-of-apps"
#     #   target_revision = "1.2.3"
# #       helm {
# #         parameter {
# #           name  = "image.tag"
# #           value = "1.2.3"
# #         }
# #         parameter {
# #           name  = "someotherparameter"
# #           value = "true"
# #         }
# #         value_files = ["values-test.yml"]
# #         values      = <<EOT
# # someparameter:
# #   enabled: true
# #   someArray:
# #   - foo
# #   - bar    
# # EOT
# #         release_name = "testing"
# #       }
#     }

#     destination {
#       server    = "https://kubernetes.default.svc"
#       namespace = "default"
#     }

#     sync_policy {
#       automated = {
#         prune       = true
#         self_heal   = true
#         allow_empty = true
#       }
#       # Only available from ArgoCD 1.5.0 onwards
#     #   sync_options = ["Validate=false"]
#     #   retry {
#     #     limit   = "5"
#     #     backoff = {
#     #       duration     = "30s"
#     #       max_duration = "2m"
#     #       factor       = "2"
#     #     }
#     #   }
#     }
#   }
# }

# # resource "argocd_application" "kustomize" {
# #   metadata {
# #     name      = "kustomize-app"
# #     namespace = "argocd"
# #     labels = {
# #       test = "true"
# #     }
# #   }

# #   spec {
# #     project = "myproject"

# #     source {
# #       repo_url        = "https://github.com/kubernetes-sigs/kustomize"
# #       path            = "examples/helloWorld"
# #       target_revision = "master"
# #       kustomize {
# #         name_prefix = "foo-"
# #         name_suffix = "-bar"
# #         images      = ["hashicorp/terraform:light"]
# #         common_labels = {
# #           "this.is.a.common" = "la-bel"
# #           "another.io/one"   = "true" 
# #         }
# #       }
# #     }

# #     destination {
# #       server    = "https://kubernetes.default.svc"
# #       namespace = "default"
# #     }

# #     sync_policy {
# #       automated = {
# #         prune       = true
# #         self_heal   = true
# #         allow_empty = true
# #       }
# #       # Only available from ArgoCD 1.5.0 onwards
# #       sync_options = ["Validate=false"]
# #       retry {
# #         limit   = "5"
# #         backoff = {
# #           duration     = "30s"
# #           max_duration = "2m"
# #           factor       = "2"
# #         }
# #       }
# #     }

# #     # ignore_difference {
# #     #   group         = "apps"
# #     #   kind          = "Deployment"
# #     #   json_pointers = ["/spec/replicas"]
# #     # }

# #     # ignore_difference {
# #     #   group         = "apps"
# #     #   kind          = "StatefulSet"
# #     #   name          = "someStatefulSet"
# #     #   json_pointers = [
# #     #     "/spec/replicas",
# #     #     "/spec/template/spec/metadata/labels/bar",
# #     #   ]
# #     #   # Only available from ArgoCD 2.1.0 onwards
# #     #   jq_path_expressions = [
# #     #     ".spec.replicas",
# #     #     ".spec.template.spec.metadata.labels.bar",
# #     #   ]
# #     # }
# #   }
# # }