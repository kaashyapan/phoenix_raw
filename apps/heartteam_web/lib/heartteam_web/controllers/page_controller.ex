defmodule HeartteamWeb.PageController do
  use HeartteamWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
