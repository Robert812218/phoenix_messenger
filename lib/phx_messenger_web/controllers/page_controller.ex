defmodule PhxMessengerWeb.PageController do
  use PhxMessengerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
