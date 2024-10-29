defmodule SwiftuiToLiveviewNative.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SwiftuiToLiveviewNativeWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:swiftui_to_liveview_native, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SwiftuiToLiveviewNative.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SwiftuiToLiveviewNative.Finch},
      # Start a worker by calling: SwiftuiToLiveviewNative.Worker.start_link(arg)
      # {SwiftuiToLiveviewNative.Worker, arg},
      # Start to serve requests, typically the last entry
      SwiftuiToLiveviewNativeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SwiftuiToLiveviewNative.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SwiftuiToLiveviewNativeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
