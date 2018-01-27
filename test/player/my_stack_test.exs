defmodule HeadsUpTest do
  use ExUnit.Case
  doctest HeadsUp

  test "mystack should work" do
    json = File.read!("./test/fixtures/game-state-1.json")
    parsed_json = Poison.decode!(json)

    assert MyStack.calculate(parsed_json) == 79.5

  end


end