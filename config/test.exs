import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :swiftui_to_liveview_native, SwiftuiToLiveviewNativeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "fjWaLZ27c8m7b/UlAsyZmhc0PjkEiWpXubGeVL2/MBf/wiulbJBRPQkUQGbeJecT",
  server: false

# In test we don't send emails
config :swiftui_to_liveview_native, SwiftuiToLiveviewNative.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
