# lib/Calculadora/application.ex
defmodule Calculadora.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: Calculadora.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: Calculadora.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
