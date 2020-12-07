defmodule RandomPointsGeneratorWeb.Router do
  use RandomPointsGeneratorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RandomPointsGeneratorWeb do
    pipe_through :api
    resources "/", UserController, only: [:index]
  end
end
