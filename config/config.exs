# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :qhuinn_space,
  ecto_repos: [QhuinnSpace.Repo]

# Configures the endpoint
config :qhuinn_space, QhuinnSpaceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tUqTJqHtCCuXoau5PG9HFwcPbk0m11l4t8WFXWwfYSt7bzmj+IIiHnxm/ZXOBlSF",
  render_errors: [view: QhuinnSpaceWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: QhuinnSpace.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
