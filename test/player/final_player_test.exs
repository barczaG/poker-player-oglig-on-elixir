defmodule FinalPlayerTest do
  use ExUnit.Case
  doctest HeadsUp

  test "final player should work1" do
    json = File.read!("./test/fixtures/game-state-1.json")
    parsed_json = Poison.decode!(json)
    IO.inspect FinalPlayer.bet_request(parsed_json)
    assert FinalPlayer.bet_request(parsed_json) == 0

  end

  test "final player should work2" do
    json = File.read!("./test/fixtures/game-state-2.json")
    parsed_json = Poison.decode!(json)

    assert FinalPlayer.bet_request(parsed_json) == 0

  end

  test "final player should work3" do
    json = File.read!("./test/fixtures/game-state-3.json")
    parsed_json = Poison.decode!(json)

    assert FinalPlayer.bet_request(parsed_json) == 10000

  end

  # test "final player should work4" do
  #   json = File.read!("./test/fixtures/game-state-3.json")
  #   parsed_json = Poison.decode!(json)
  #   parsed_json["pot"] = 150 

  #   assert FinalPlayer.bet_request(parsed_json) == 10000

  # end

  test "final player should work5" do
    json = File.read!("./test/fixtures/game-state-5.json")
    parsed_json = Poison.decode!(json)

    assert FinalPlayer.bet_request(parsed_json) == 0

  end

  # test "final player should work6" do
  #   json = File.read!("./test/fixtures/game-state-5.json")
  #   parsed_json = Poison.decode!(json)
  #   parsed_json["players"][parsed_json["in_action"]]["stack"] = 20

  #   assert FinalPlayer.bet_request(parsed_json) == 20

  # end

  # test "final player should work7" do
  #   json = File.read!("./test/fixtures/game-state-3.json")
  #   parsed_json = Poison.decode!(json)
  #   parsed_json["pot"] = 150 

  #   assert FinalPlayer.bet_request(parsed_json) == 10000

  # end

  test "final player should work8" do
    json = File.read!("./test/fixtures/game-state-6.json")
    parsed_json = Poison.decode!(json)

    assert FinalPlayer.bet_request(parsed_json) == 900

  end

end