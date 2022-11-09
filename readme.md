<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.31.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_EKS"></a> [EKS](#module\_EKS) | ./EKS | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | Availability Zones | `list(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | variable "public\_subnet\_cidrs" { type        = string description = "Public Subnet CIDR values" } variable "private\_subnet\_cidrs" { type        = string description = "Private Subnet CIDR values" } | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->