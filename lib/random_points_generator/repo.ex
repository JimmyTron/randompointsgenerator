defmodule RandomPointsGenerator.Repo do
  use Ecto.Repo,
    otp_app: :random_points_generator,
    adapter: Ecto.Adapters.Postgres
end
