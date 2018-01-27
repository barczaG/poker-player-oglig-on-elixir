defmodule EffectiveStack do
  alias Poison.Parser
  @version "0.0.1"

  def calculate(game_state) do
    bigBlind = 2 * game_state["small_blind"]
    players = game_state["players"] 
    myPlayerId = game_state["in_action"]
    myPlayer = Enum.at(players, myPlayerId)
    myPlayerBet = myPlayer["bet"]
    myPlayerStack = myPlayer["stack"]
    myPlayerSum = (myPlayerBet + myPlayerStack) / bigBlind

    Enum.each(players, fn player -> {
      if player["id"] !== myPlayerId && (player.status === "active") do:
        IO.puts "rock"
    })

    IO.puts bigBlind
    IO.puts myPlayerSum

  end
end