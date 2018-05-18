use Mix.Config

config :hello, HelloWeb.Endpoint,
  load_from_system_env: true,
  url: [scheme: "https", host: System.get_env("CF_INSTANCE_GUID"), port: System.get_env("PORT")],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :hello, Hello.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
