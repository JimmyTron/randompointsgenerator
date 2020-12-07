defmodule RandomPointsGenerator.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field :points, :integer
    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:points])
    |> validate_required([:points])
    |> validate_inclusion(:points, 0..100, message: "points must be between 1 and 100")
  end

  @doc """
   This function takes in a random integer(max_number) and returns an Ecto.Query, it  fetches  users with points great the max_number, the user are ordered in descending order using the point therefore this query will fetch two users with highest points.
  """
  @spec users_with_points_greater_than_max_number(Integer.t()) :: Ecto.Query.t()
  def users_with_points_greater_than_max_number(max_number) do
    from u in __MODULE__,
      where: u.points > ^max_number,
      order_by: [desc: u.points],
      limit: 2,
      select: %{id: u.id, points: u.points}
  end
end
