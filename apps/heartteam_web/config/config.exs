# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :heartteam_web,
  namespace: HeartteamWeb

# Configures the endpoint
config :heartteam_web, HeartteamWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Vnnlf7v178ZUGXKuKbB0kDTPQZADncob6O9+tHk/KMqLIbgyqJJfyLuuBM7BJiuD",
  render_errors: [view: HeartteamWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HeartteamWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :heartteam_web, :generators,
  context_app: :heartteam

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
