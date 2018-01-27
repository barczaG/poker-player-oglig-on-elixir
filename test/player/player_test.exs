defmodule PlayerTest do
  use ExUnit.Case
  doctest Player

  test "to_num() should work" do
    assert Player.to_num("J") == 11
    assert Player.to_num("Q") == 12
    assert Player.to_num("K") == 13
    assert Player.to_num("A") == 14
    assert Player.to_num("8") == 8
    assert Player.to_num("7") == 7
  end

  test "cards_value() should work" do
    assert Player.cards_value([
      %{"rank" => "6", "suit" => "hearts"},
      %{"rank" => "K", "suit" => "spades"}
    ]) === 19
  end
end