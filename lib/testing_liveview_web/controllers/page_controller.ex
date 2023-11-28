defmodule TestingLiveviewWeb.PageController do
  use TestingLiveviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
