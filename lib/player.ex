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
      true -> card / 2 |> Integer.parse()
    end
  end

  # def cards_value(cards), do: Player.to_num(hd(cards)) + Player.to_num(tl(cards))
  def cards_value(cards) do
    cards |> Enum.map(to_num()) |> Enum.sum()
  end
end
