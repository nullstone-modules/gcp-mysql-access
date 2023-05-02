data "ns_connection" "mysql" {
  name     = "mysql"
  type     = "mysql/gcp"
  contract = "gcp/mysql/cloudsql:*"
}

locals {
  db_name      = data.ns_connection.mysql.outputs.db_name
  db_endpoint  = data.ns_connection.mysql.outputs.db_endpoint
  db_subdomain = split(":", local.db_endpoint)[0]
  db_port      = split(":", local.db_endpoint)[1]
}
