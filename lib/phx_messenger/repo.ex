defmodule PhxMessenger.Repo do
  use Ecto.Repo,
    otp_app: :phx_messenger,
    adapter: Ecto.Adapters.Postgres
end
