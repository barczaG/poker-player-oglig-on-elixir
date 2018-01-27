defmodule EffectiveStackTest do
  use ExUnit.Case
  doctest EffectiveStack

  # test "to_num() should work" do
  #   gameState = %{small_blind: 1}
  #   EffectiveStack.calculate(gameState)
  # end

  test "cards_value() should work" do
    IO.puts(File.cwd!())
    json = File.read!("preflop-table.json")
    game_state = Poison.decode!(json)

    IO.puts game_state

    EffectiveStack.calculate(game_state)
  end
end
