output "cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "CIDR block of the created VPC"
}
