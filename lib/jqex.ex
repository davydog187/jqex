defmodule Jqex do
  @moduledoc """
  Documentation for `Jqex`.
  """

  def main(_args) do
    input = IO.read(:stdio, :all)

    case Jason.decode(input) do
      {:ok, json} ->
        json |> inspect(pretty: true) |> IO.write()
        IO.write("\n")

      {:error, error} ->
        IO.inspect(error)
    end
  end
end
