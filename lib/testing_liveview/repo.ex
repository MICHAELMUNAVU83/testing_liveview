defmodule TestingLiveview.Repo do
  use Ecto.Repo,
    otp_app: :testing_liveview,
    adapter: Ecto.Adapters.Postgres
end
