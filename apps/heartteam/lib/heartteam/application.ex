defmodule Heartteam.Application do
  @moduledoc """
  The Heartteam Application Service.

  The heartteam system business domain lives in this application.

  Exposes API to clients such as the `HeartteamWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      
    ], strategy: :one_for_one, name: Heartteam.Supervisor)
  end
end
