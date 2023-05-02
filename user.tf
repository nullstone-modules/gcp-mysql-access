resource "google_sql_user" "this" {
  name            = local.database_name
  instance        = local.db_name
  type            = "BUILT_IN"
  deletion_policy = "ABANDON"
  host            = "%"
  password        = random_password.this.result
}
