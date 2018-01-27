defmodule CardsToTable do
  alias Poison.Parser

  defp to_num(card) do
    cond do
      card === "J" -> 11
      card === "Q" -> 12
      card === "K" -> 13
      card === "A" -> 14
      true -> String.to_integer(card)
    end
  end

  defp format_rank(rank) do
    cond do
      rank === "10" -> "T"
      true -> rank
    end
  end

  def convert(cards) do

  end

  def get_percentage(cards) do
    card = CardsToTable.convert(cards)
    preflop_table = "preflop-table.json" |> File.read!() |> Poison.decode!
    record = 
  end
end
