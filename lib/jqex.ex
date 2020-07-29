defmodule Jqex do
  @moduledoc """
  Documentation for `Jqex`.
  """

  def main(_args) do
    IO.stream(:stdio, :line)
    |> Enum.each(fn line ->
      line |> Jason.decode!() |> inspect() |> IO.write()
      IO.write("\n")
    end)
  end
end
