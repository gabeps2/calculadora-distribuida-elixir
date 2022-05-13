# lib/Calculadora.ex
defmodule Calculadora do

  def receive_result(result) do
    IO.puts "Resultado da operação: #{result}"
  end

  def returnResult(recipient, result) do
      spawn_task(__MODULE__, :receive_result, recipient, [result])
  end

  def operacoes() do
    lista = "
    Operações disponíveis:

      soma
      subtracao
      divisao
      multiplicacao
    "
    IO.puts lista
  end

  def help() do
    IO.puts "

    A função calc() recebe 4 valores como parâmetros,
    o 1ª se refere a quem irá receber e processar a solicitação,
    o 2º a operação matemática,
    o 3º e o 4º são referentes aos valores que serão usados nas operações

    Exemplo: Calculadora.calc(:alex@localhost, 'soma', 1, 6)

    Utilize Calculadora.operacoes() para consultar a lista de operações disponíveis

    "
  end

  def process(op, num1, num2, from) do

    if(op == "soma") do
      result = num1 + num2
      returnResult(from, result)
      IO.puts "#{num1} + #{num2} = #{result}"
    end
      if (op == "subtracao") do
      result = num1 - num2
      returnResult(from, result)
      IO.puts "#{num1} - #{num2} = #{result}"
      end

    if (op == "divisao") do
      result = num1 / num2
      returnResult(from, result)
      IO.puts "#{num1} / #{num2} = #{result}"
    end

    if(op == "multiplicacao") do
      result = num1 * num2
      returnResult(from, result)
      IO.puts "#{num1} * #{num2} = #{result}"
    end

  end

  def calc(recipient, op, num1, num2) do
    spawn_task(__MODULE__, :process, recipient, [op, num1, num2, Node.self()])
  end

  def spawn_task(module, fun, recipient, args) do
    recipient
    |> remote_supervisor()
    |> Task.Supervisor.async(module, fun, args)
    |> Task.await()
  end

  defp remote_supervisor(recipient) do
    {Calculadora.TaskSupervisor, recipient}
  end
end
