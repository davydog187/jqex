defmodule Jqex do
  @moduledoc """
  Documentation for `Jqex`.
  """
  require Logger

  def main(args) do
    input = if length(args)>0 do
      if String.starts_with?(List.last(args), "http") do
        with {ret, 0} <- System.cmd("curl", args) do
          ret
        else _ ->
          ""
        end
      else
        Enum.join(args, " ")
      end
    else
      IO.read(:stdio, :all)
    end

    case Jason.decode(input) do
      {:ok, json} ->
        json |> inspect(pretty: true) |> IO.write()
        IO.write("\n")

      {:error, error} ->
        Logger.error(inspect error)
    end
  end

end
