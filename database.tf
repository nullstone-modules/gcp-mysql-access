resource "restapi_object" "database" {
  path         = "/databases"
  id_attribute = "name"
  object_id    = local.database_name
  force_new    = [local.database_name]
  destroy_path = "/skip"

  data = jsonencode({
    name                = local.database_name
    defaultCharacterSet = "utf8"
    defaultCollation    = "utf8_general_ci"
    useExisting         = true
  })

  depends_on = [restapi_object.database]
}
