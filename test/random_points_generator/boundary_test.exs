defmodule RandomPointsGenerator.Test do
  use RandomPointsGenerator.DataCase
  alias RandomPointsGenerator.{Boundary, User}

  test "users_with_higher_points/1 return max of two users with points higher than max_number" do
    max_number = 10
    users_points = [10, 50, 30, 20]

    users_points |> Enum.each(fn points -> Repo.insert!(%User{points: points}) end)
    users = Boundary.users_with_higher_points(max_number)
    assert Enum.count(users) == 2
    assert users |> Enum.into([], fn user -> user.points end) == [50, 30]
  end

  test "update_users_with_random_points/0 updates each user with a random point between 1 and 100" do
    1..4
    |> Enum.each(fn _points -> Repo.insert!(%User{points: 0}) end)

    assert {4, nil} == Boundary.update_users_with_random_points()

    refute updated_points() == [0, 0, 0, 0]

    for updated_point <- updated_points() do
      assert updated_point in 0..100
    end
  end

  defp updated_points do
    User |> select([u], u.points) |> Repo.all()
  end
end
