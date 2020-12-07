# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :random_points_generator,
  ecto_repos: [RandomPointsGenerator.Repo]

# Configures the endpoint
config :random_points_generator, RandomPointsGeneratorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mqFzDWa0inti5Rae1wC+l+b4+41RYYfcpKAZT2Tq7GVf8xNLuiiVJG9htFoZlm0L",
  render_errors: [view: RandomPointsGeneratorWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RandomPointsGenerator.PubSub,
  live_view: [signing_salt: "zLasZFNt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
