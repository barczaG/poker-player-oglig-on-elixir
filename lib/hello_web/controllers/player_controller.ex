defmodule HelloWeb.PlayerController do
  use HelloWeb, :controller
  @version "0.0.1"

  def index(conn, params) do
    IO.inspect params
    IO.inspect params["action"]

    action = params["action"]

    case action do
      "version" -> text conn, HelloWeb.PlayerController.version()
      "bet_request" -> text conn, HelloWeb.PlayerController.bet_request()
      "showdown" -> text conn, HelloWeb.PlayerController.showdown()
      _ -> ""
    end
    # text conn, "Showing"
  end

  def bet_request() do
    Enum.random(0..100)
  end

  def showdown() do
    "ok"
  end

  def version, do: @version
end
