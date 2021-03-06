defmodule RandomPointsGenerator.Boundary do
  alias RandomPointsGenerator.User
  alias RandomPointsGenerator.Repo
  import Ecto.Query

  @moduledoc """
  Boundary keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc """
   Returns a list of a maximum of two users whose points are greater than the `max_number`
  """
  @spec users_with_higher_points(Integer.t()) :: list(map()) | []
  def users_with_higher_points(max_number) do
    max_number
    |> User.users_with_points_greater_than_max_number()
    |> Repo.all()
  end

  @doc """
   Sequentially update points of  each user in the database using a random integer whose value is between 0 and 100
  """

  @spec update_users_with_random_points :: {Integer.t(), nil}
  def update_users_with_random_points do
    User
    |> Repo.update_all(
      set: [
        points: dynamic(fragment("floor(random() * 100 + 0)"))
      ]
    )
  end

  @doc """
   Returns a tuple of two elements whose values is a list of users and timestamp
  """
  @spec view_users :: {list(map()) | [], nil | NaiveDateTime.t()}
  def view_users() do
    GenServer.call(:rand_gen, :get_server_info)
  end
end
