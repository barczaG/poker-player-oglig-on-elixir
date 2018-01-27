defmodule MyStack do
  def calculate(game_state) do
    my_player = Enum.find(game_state["players"], fn(player) -> player["id"] == game_state["in_action"] end)
    my_stack = my_player["stack"]
    my_stack / (game_state["small_blind"] * 2)
  end
end
