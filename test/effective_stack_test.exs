defmodule EffectiveStackTest do
  use ExUnit.Case
  doctest EffectiveStack

  test "calculate() should work 3" do
    game_state = "game-state.json" |> File.read!() |> Poison.decode!()

    IO.inspect EffectiveStack.calculate(game_state)
  end
end
