defmodule PhxMessengerWeb.Router do
  use PhxMessengerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxMessengerWeb do
    pipe_through :browser

    get "/", RoomController, :index
    resources("/", RoomController, except: [:index])
  end
end
