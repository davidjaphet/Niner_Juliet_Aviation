defmodule NinerJulietAviation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NinerJulietAviationWeb.Telemetry,
      NinerJulietAviation.Repo,
      {DNSCluster, query: Application.get_env(:niner_juliet_aviation, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NinerJulietAviation.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NinerJulietAviation.Finch},
      # Start a worker by calling: NinerJulietAviation.Worker.start_link(arg)
      # {NinerJulietAviation.Worker, arg},
      # Start to serve requests, typically the last entry
      NinerJulietAviationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NinerJulietAviation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NinerJulietAviationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
