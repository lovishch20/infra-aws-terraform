output "db-instance-public-ip" {
  description = "Db-Instance name"
  value = module.cloudsql.db-instance-public-ip
}


output "db-instance-connection-name" {
  description = "Db-Instance name"
  value = module.cloudsql.db-instance-connection-name
}


output "db-instance-service-account" {
  description = "Db-Instance name"
  value = module.cloudsql.db-instance-service-account
}

output "db-instance-self-link" {
  description = "databse-name"
  value = module.cloudsql.db-instance-self-link
}


output "database-id" {
  description = "databse-name"
  value = module.cloudsql.database-id
}

output "user-id" {
  description = "User ID"
  value = module.cloudsql.user-id
}

output "user-password" {
  value       = module.cloudsql.user-password
  description = "The password for logging in to the database."
  sensitive   = true
}
