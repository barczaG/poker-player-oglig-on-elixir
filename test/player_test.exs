defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "to_num() should work" do
    assert Player.to_num("J") == 6
    assert Player.to_num("Q") == 7
    assert Player.to_num("K") == 8
    assert Player.to_num("A") == 10
    assert Player.to_num("8") == 4
    assert Player.to_num("7") == 3.5
  end

  test "cards_value() should work" do
    assert Player.cards_value(["J", "A"]) === 16
  end
end
