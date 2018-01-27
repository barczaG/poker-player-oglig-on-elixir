defmodule FinalPlayer do
  
  def isRaised(game_state) do
    game_state["pot"] > (game_state["small_blind"] * 5)
  end

  def bet_request(game_state) do
    my_player = Enum.find(game_state["players"], fn(player) -> player["id"] == game_state["in_action"] end)
    cards = my_player["hole_cards"]
    percentage = CardsToTable.get_percentage(cards)

    raised = FinalPlayer.isRaised(game_state)
    isHeadsUp = HeadsUp.calculate(game_state)
    effectiveStack = EffectiveStack.calculate(game_state)

    IO.inspect percentage
    IO.inspect raised
    IO.inspect isHeadsUp
    IO.inspect effectiveStack
    
    betValue = 0
    betValue = cond do 
      effectiveStack <= 3 and !raised and percentage < 81 -> my_player["stack"]
      effectiveStack <= 3 and percentage < 48 -> my_player["stack"]

      effectiveStack > 3 and effectiveStack <= 10 and !raised and percentage < 31 -> my_player["stack"]
      effectiveStack > 3 and effectiveStack <= 10  and percentage < 15 -> my_player["stack"]

      effectiveStack > 10 and effectiveStack <= 20 and !raised and percentage < 21 -> my_player["stack"]
      effectiveStack > 10 and effectiveStack <= 20 and percentage < 13 -> my_player["stack"]

      effectiveStack > 20 and effectiveStack <= 50 and !raised and percentage < 8 -> my_player["stack"]
      effectiveStack > 20 and effectiveStack <= 50 and percentage < 6 -> my_player["stack"]

      !raised and percentage < 4 -> my_player["stack"]
      percentage < 3.1 -> my_player["stack"]
      true -> 0
    end 

    betValue = if isHeadsUp do
      if game_state["pot"] <= game_state["small_blind"] * 4 do
        cond do
          effectiveStack <= 3 -> my_player["stack"]
          effectiveStack > 3 and effectiveStack <= 6 and percentage < 78.7 -> my_player["stack"]
          effectiveStack > 6 and effectiveStack <= 10 and percentage < 61 -> my_player["stack"]
          effectiveStack > 10 and effectiveStack <= 15 and percentage < 50 -> my_player["stack"]
          effectiveStack > 15 and effectiveStack <= 25 and percentage < 26 -> my_player["stack"]
          effectiveStack > 25 and effectiveStack <= 50 and percentage < 18 -> my_player["stack"]
          true -> 0
        end
      else
        cond do
          effectiveStack <= 3 and percentage < 77 -> my_player["stack"]
          effectiveStack > 3 and effectiveStack <= 6 and percentage < 49 -> my_player["stack"]
          effectiveStack > 6 and effectiveStack <= 10 and percentage < 42 -> my_player["stack"]
          effectiveStack > 10 and effectiveStack <= 15 and percentage < 29 -> my_player["stack"]
          effectiveStack > 15 and effectiveStack <= 25 and percentage < 22 -> my_player["stack"]
          effectiveStack > 25 and effectiveStack <= 50 and percentage < 13 -> my_player["stack"]
          true -> 0
        end
      end
    else
      0
    end

    betValue
  end
end
