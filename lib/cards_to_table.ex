defmodule CardsToTable do
  def to_num(card) do
    cond do
      card === "J" -> 11
      card === "Q" -> 12
      card === "K" -> 13
      card === "A" -> 14
      true -> String.to_integer(card)
    end
  end

  def format_rank(rank) do
    cond do
      rank === "10" -> "T"
      true -> rank
    end
  end

  def convert(cards) do
    IO.puts(hd(cards)["rank"])
    first_card_num = CardsToTable.to_num(hd(cards)["rank"])
    second_card_num = CardsToTable.to_num(tl(cards)["rank"])

    first_card_str = CardsToTable.format_rank(hd(cards)["rank"])
    second_card_str = CardsToTable.format_rank(tl(cards)["rank"])

    if first_card_num > second_card_num do
      table_str = first_card_str <> second_card_str
    else
      table_str = second_card_str <> first_card_str
    end

    if hd(cards)["suit"] === tl(cards)["suit"] do
      table_str = Enum.join(table_str, "s")
    else
      table_str = Enum.join(table_str, "o")
    end

    table_str
  end

  def get_percentage(cards) do
    card = CardsToTable.convert(cards)
    preflop_table = "preflop-table.json" |> File.read!() |> Poison.decode!
    record = Enum.find_value(preflop_table, fn(table) -> table["cards"] === card end)

    record["percentage"]
  end
end
