# Calculadora | Elixir | Aplicações distribuídas

Este projeto é um exemplo didádico do funcionamento de tarefas distribuídas utilizando a linguagem Elixir

## Requisitos

[Erlang/OTP 24](https://www.erlang.org/downloads) [erts-12.3.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]

[Elixir 1.12.0](https://elixir-lang.org/install.html) (compiled with Erlang/OTP 22)

## Execução do projeto

Em uma janela do terminal, inicie o app em uma sessão iex nomeada:

```elixir
iex --sname alex@localhost -S mix
```

Abra outra janela no terminal para iniciar o app em um diferente nó de processamento nomeado:

```elixir
iex --sname kate@localhost -S mix
```

Agora, através do nó alex, vamo enviar uma operação que será executada e exibida no nó kate e que retornará ao nó alex o resultado:

```elixir
iex(alex@localhost)2> Calculadora.calc(:kate@localhost, "soma", 10, 5)
```
Observe o resultado no nó kate:

```elixir
iex(kate@localhost)1> 10 / 5 = 2.0
```

Observe o retorno exibido no nó alex:
```elixir
iex(alex@localhost)2> Resultado da operação: 2.0
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.