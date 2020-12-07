defmodule RandomPointsGenerator.Server do
  @moduledoc """
  The Server manages the state of the application, the state is a tuple of two elements, `timestamp` which is NaiveDateTime and `max_number` an Integer.For the initial state timestamp has a value of nil.

  ## Periodic Updates
  Each user's  points is update periodically after every minute with a random integer whose value range between 1 to 100.
  The max_number is also updated with random integer whose value ranges from 1 to 100

  ##  Retrival
  Tuple of two elements which contains a list of maximum of two users whose points are greater than current value of max_number in state and the current timestamp.
  The timestamp element in the state is the updated to current NaiveDateTime.
  """
  use GenServer
  alias RandomPointsGenerator.{Boundary, Core}

  # client

  def start_link({initial_state, name}),
    do: GenServer.start_link(__MODULE__, initial_state, name: name)

  # server

  def init(state) do
    _next_server_run()
    {:ok, state}
  end

  def handle_info(:update_users, state) do
    _next_server_run()
    Boundary.update_users_with_random_points()
    {:noreply, Core.update_max_number(state)}
  end

  def handle_call(:get_server_info, _from, {timestamp, max_number} = state) do
    {:reply, {Boundary.users_with_higher_points(max_number), timestamp},
     Core.update_timestamp(state)}
  end

  defp _next_server_run(), do: :timer.send_interval(60000, self(), :update_users)
end
