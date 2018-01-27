defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "to_num() should work" do
    assert Player.to_num("J") == 6
    assert Player.to_num("Q") == 7
    assert Player.to_num("K") == 8
    assert Player.to_num("A") == 10
  end

  test "cards_value() should work" do
    IO.puts(Player.cards_value([9, 2]))
    assert Player.cards_value(["J", "A"]) === 16
  end
end
