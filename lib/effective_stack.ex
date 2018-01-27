defmodule EffectiveStack do
  alias Poison.Parser
  @version "0.0.1"

  def calculate(game_state) do
    game_state = Parser.parse!(game_state||"{}")
    bigBlind = 2 * game_state.small_blind
    # myPlayerBet = gameState.players[gameState.in_action].bet
    # myPlayerStack = gameState.players[gameState.in_action].stack
    # myPlayerSum = (myPlayerBet + myPlayerStack) / bigBlind
    IO.puts bigBlind
  end
end