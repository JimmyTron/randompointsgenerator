defmodule RandomPointsGeneratorWeb.Router do
  use RandomPointsGeneratorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RandomPointsGeneratorWeb do
    pipe_through :api
  end
end
