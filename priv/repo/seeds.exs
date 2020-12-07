# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RandomPointsGenerator.Repo.insert!(%RandomPointsGenerator.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias RandomPointsGenerator.Repo
alias RandomPointsGenerator.User
Repo.delete_all(User)
Enum.each(1..100, fn _x -> Repo.insert!(%User{points: 0}) end)
