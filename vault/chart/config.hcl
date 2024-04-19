storage "postgresql" {
  connection_url = "postgres://USER:PASSWORD@HOST:PORT/DB_NAME"
  table = "vault_kv_store"
  max_idle_connections = 125
  ha_enabled = "true"
  ha_table = "vault_ha_locks"
}
