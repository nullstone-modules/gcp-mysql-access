resource "restapi_object" "user" {
  path         = "/users"
  id_attribute = "name"
  object_id    = local.username
  force_new    = [local.username]
  destroy_path = "/skip"

  data = jsonencode({
    name        = local.username
    password    = random_password.this.result
    useExisting = true
  })
}

resource "restapi_object" "db_privileges" {
  path         = "/databases/${local.database_name}/db_privileges"
  id_attribute = "username"
  object_id    = "${local.database_name}::${local.username}"
  force_new    = [local.database_name, local.username]
  destroy_path = "/skip"

  data = jsonencode({
    database = local.database_name
    username = local.username
  })

  depends_on = [
    restapi_object.database,
    restapi_object.user
  ]
}
