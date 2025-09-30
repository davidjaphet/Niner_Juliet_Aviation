defmodule NinerJulietAviation.Repo do
  use Ecto.Repo,
    otp_app: :niner_juliet_aviation,
    adapter: Ecto.Adapters.Postgres
end
