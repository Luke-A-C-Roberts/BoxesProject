defmodule BoxesProj.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BoxesProjWeb.Telemetry,
      BoxesProj.Repo,
      {DNSCluster, query: Application.get_env(:boxes_proj, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BoxesProj.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BoxesProj.Finch},
      # Start a worker by calling: BoxesProj.Worker.start_link(arg)
      # {BoxesProj.Worker, arg},
      # Start to serve requests, typically the last entry
      BoxesProjWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BoxesProj.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BoxesProjWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
