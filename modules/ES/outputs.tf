output "domain_name" {
  value       = module.elasticsearch.domain_name
  description = "Name of the Elasticsearch domain"
}

output "security_groups" {
  value       = module.elasticsearch.security_group_id
  description = "The id of the security groups"
}