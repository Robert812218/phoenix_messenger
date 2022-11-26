defmodule PhxMessengerWeb.RoomController do
  use PhxMessengerWeb, :controller

  alias PhxMessenger.Talk.Room
  alias PhxMessenger.Talk
  alias PhxMessenger.Repo

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}) do
    case Talk.create_room(room_params) do
      {:ok, room} ->
        conn
        |> put_flash(:info, "Room Created")
        |> redurect(to: Routes.room_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
