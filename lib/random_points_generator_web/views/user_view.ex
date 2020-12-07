defmodule RandomPointsGeneratorWeb.UserView do
  use RandomPointsGeneratorWeb, :view

  def render("index.json", %{users: users, timestamp: timestamp}) do
    %{users: users, timestamp: timestamp_to_string(timestamp)}
  end
  defp timestamp_to_string(nil), do: nil
  defp timestamp_to_string(timestamp), do: to_string(timestamp)

end
