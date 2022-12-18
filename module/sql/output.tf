#instance

output "master_instance_name" {
  description = "The name of the master database instance"
  value       = google_sql_database_instance.sql_master.name
}

output "master_public_ip_address" {
  description = "The public IPv4 address of the master instance."
  value       = google_sql_database_instance.sql_master.public_ip_address
}

output "master_private_ip_address" {
  description = "The private IPv4 address of the master instance."
  value       = google_sql_database_instance.sql_master.private_ip_address
}

output "master_instance" {
  description = "Self link to the master instance"
  value       = google_sql_database_instance.sql_master.self_link
}

#database

# output "db" {
#   description = "Self link to the database"
#   value       = google_sql_database.database.self_link
# }

# output "db_name" {
#   description = "Name of the database"
#   value       = google_sql_database.database.name
# }
