data "ns_connection" "mysql" {
  name     = "mysql"
  type     = "mysql/gcp"
  contract = "datastore/gcp/mysql:*"
}

locals {
  db_name      = data.ns_connection.mysql.outputs.db_instance_name
  db_endpoint  = data.ns_connection.mysql.outputs.db_endpoint
  db_subdomain = split(":", local.db_endpoint)[0]
  db_port      = split(":", local.db_endpoint)[1]
}
