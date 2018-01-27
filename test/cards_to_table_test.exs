defmodule CardsToTableTest do
  use ExUnit.Case
  doctest CardsToTable

  test "poison parse example" do
    IO.puts(File.cwd!())
    json = File.read!("preflop-table.json")
    parsed_json = Poison.decode!(json)

    parsed_json |> Enum.each(fn(table) -> IO.puts(table["cards"]) end)
  end
end
