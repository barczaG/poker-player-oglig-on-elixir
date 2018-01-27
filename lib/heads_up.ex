

defmodule HeadsUp do
  def calculate(game_state) do
    active_players = Enum.filter(game_state["players"], fn (player) -> player["status"] == "active" end)
    length(active_players) == 2
  end
end
