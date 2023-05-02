resource "google_sql_database" "this" {
  name            = local.database_name
  instance        = local.db_name
  deletion_policy = "ABANDON"
  charset         = "utf8"
  collation       = "utf8_general_ci"
}
