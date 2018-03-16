# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lunch_predictor,
  ecto_repos: [LunchPredictor.Repo]

# Configures the endpoint
config :lunch_predictor, LunchPredictorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VQ8bK6QIUumTAZe0SyK2j4ri5d93u10UIubCgj5ETscIF068ebJcWM5Igsqxr3H+",
  render_errors: [view: LunchPredictorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LunchPredictor.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
