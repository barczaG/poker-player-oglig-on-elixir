defmodule HeadsUpTest do
  use ExUnit.Case
  doctest HeadsUp

  test "headsup should work" do
    json = File.read!("./test/fixtures/game-state-1.json")
    parsed_json = Poison.decode!(json)

    assert HeadsUp.calculate(parsed_json) == true

  end

  test "headsup should work 2" do
    json = File.read!("./test/fixtures/game-state-4.json")
    parsed_json = Poison.decode!(json)

    assert HeadsUp.calculate(parsed_json) == false

  end

end