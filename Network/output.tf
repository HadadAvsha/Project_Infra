# output "SG_id" {
#   value = aws_security_group.avsha_sg.id
# }
output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "public_subnets_ids" {
  value = tolist(aws_subnet.public_subnets[*].id)
}
# output "subnets_name" {
#   value = tolist(aws_subnet.public_subnets[*])
# }
# output "private_subnets_ids" {
#   value = tolist(aws_subnet.private_subnets[*].id)
# }