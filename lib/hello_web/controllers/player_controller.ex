defmodule HelloWeb.PlayerController do
  use HelloWeb, :controller
  alias Poison.Parser
  @version "0.1.0 hojj"

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
    FinalPlayer.bet_request(game_state)
  end

  def showdown() do
    "ok"
  end

  def version, do: @version
end
