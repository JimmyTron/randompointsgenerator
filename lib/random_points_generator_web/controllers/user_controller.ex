defmodule RandomPointsGeneratorWeb.UserController do
  use RandomPointsGeneratorWeb, :controller
  alias RandomPointsGenerator.Boundary

  def index(conn, _params) do
    {users, timestamp} = Boundary.view_users()
    render(conn, "index.json", users: users, timestamp: timestamp)
  end
end
