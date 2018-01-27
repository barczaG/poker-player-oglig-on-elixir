defmodule HelloWeb.PlayerController do
  use HelloWeb, :controller
  alias Poison.Parser
  @version "0.0.1"

  def index(conn, params) do
    # IO.inspect params
    # IO.inspect params["action"]

    action = params["action"]
    game_state = Parser.parse!(params["game_state"]||"{}")
    case action do
      "version" -> text conn, HelloWeb.PlayerController.version()
      "bet_request" -> text conn, HelloWeb.PlayerController.bet_request(game_state)
      "showdown" -> text conn, HelloWeb.PlayerController.showdown()
      _ -> ""
    end
    # text conn, "Showing"
  end

  def bet_request(game_state) do
    #const myPlayer = _.findWhere(gameState.players, {id: gameState.in_action})
    #const cards = myPlayer.hole_cards
    my_player = Enum.find(game_state["players"], fn(player) -> player["id"] == game_state["in_action"] end)
    cards = my_player["hole_cards"]

    points = Player.cards_value(cards)
    IO.inspect points
    case points do
      x when points > 12 -> my_player["stack"]
      _ -> 0
    end
    
    # IO.inspect my_player
    # IO.inspect cards
    # Enum.random(0..100)
  end

  def showdown() do
    "ok"
  end

  def version, do: @version
end
