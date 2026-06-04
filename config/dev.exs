import Config

# Configure your database
config :niner_juliet_aviation, NinerJulietAviation.Repo,
  username: "postgres",
  password: "Password",
  hostname: "localhost",
  database: "niner_juliet_aviation_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :niner_juliet_aviation, NinerJulietAviationWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: System.get_env("SECRET_KEY_BASE") || raise("missing SECRET_KEY_BASE env var"),
  watchers: [
    esbuild:
      {Esbuild, :install_and_run, [:niner_juliet_aviation, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:niner_juliet_aviation, ~w(--watch)]}
  ]

# Watch static and templates for browser reloading.
config :niner_juliet_aviation, NinerJulietAviationWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/niner_juliet_aviation_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

# Enable dev routes for dashboard and mailbox
config :niner_juliet_aviation, dev_routes: true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  enable_expensive_runtime_checks: true

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false
