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

    activePlayers = Enum.count(players, fn(player) -> player["id"] !== myPlayerId && player["status"] === "active" end)

    other_players_stack_sum = Enum.reduce(players, 0, fn(player, sum_stack) ->
      if player["id"] !== myPlayerId && player["status"] === "active" do
        # IO.inspect sum_stack
        # IO.inspect player["stack"]
        # IO.inspect player["bet"]
        sum_stack + ((player["stack"] + player["bet"]) / bigBlind)
      else
        sum_stack
      end
    end
    )

    # IO.inspect other_players_stack_sum

    other_players_avg_stack = other_players_stack_sum / activePlayers

    if myPlayerSum < other_players_avg_stack do
      myPlayerSum
    else
      other_players_avg_stack
    end

  end
end