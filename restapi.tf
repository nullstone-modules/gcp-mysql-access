provider "google" {
  alias       = "invoker"
  credentials = local.db_admin_invoker.private_key
}

data "google_client_config" "invoker" {
  provider = google.invoker
}

provider "restapi" {
  uri                  = coalesce(local.db_admin_func_url, "https://missing-db-admin-url")
  write_returns_object = true

  headers = {
    "Authorization" : "Bearer ${data.google_client_config.invoker.access_token}"
  }
}
