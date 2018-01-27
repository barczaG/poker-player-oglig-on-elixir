defmodule Player do
  @version "0.0.1"
  def bet_request(game_state) do
    0
  end

  def showdown(game_state) do
    "ok"
  end

  def version, do: @version

  def to_num(card) do
    cond do
      card === "J" -> 6
      card === "Q" -> 7
      card === "K" -> 8
      card === "A" -> 10
      is_number(String.to_integer(card)) -> String.to_integer(card) / 2
      # true -> String.to_integer(card) / 2
    end
  end

  def cards_value(cards) do
    # IO.inspect cards[0]["rank"]
    # cards |> Enum.map(fn(card) -> IO.inspect(card) end)
    cards |>  Enum.map(fn(card) -> Player.to_num(card["rank"]) end) |> Enum.sum() 
  end
end