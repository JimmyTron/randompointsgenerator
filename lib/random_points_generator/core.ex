defmodule RandomPointsGenerator.Core do
  @moduledoc """
  The Core tries to separate state manipulation logic from the Server, the functions in this module act majorly as reducers in that they take in a tuple of NaiveDateTime  and an Interger whose value range from  0 and 100 manipulate it and return a tuple.Though functions found here are not truly pure as their return values contain both an Integer and NaiveDateTime ,they are used to change the state of the Server therefore allowing easy testing of the state current state.
  """

  @doc """
    Returns a two element tuple whose values are nil and an integer
  """
  @spec new :: {nil, Integer.t()}
  def new(), do: {nil, _max_number()}

  @doc """
    This function takes in a two element and  updates the first element to the current time.
  """
  @spec update_timestamp({nil | NaiveDateTime.t(), Integer.t()}) ::
          {nil | NaiveDateTime.t(), Integer.t()}
  def update_timestamp(state) do
    state
    |> put_elem(0, _new_timestamp())
  end

  @doc """
    This function takes in a two element and  updates the second element with a random integer.
  """
  @spec update_max_number({nil | NaiveDateTime.t(), Integer.t()}) ::
          {nil | NaiveDateTime.t(), Integer.t()}
  def update_max_number(state) do
    state
    |> put_elem(1, _max_number())
  end

  defp _new_timestamp do
    NaiveDateTime.utc_now()
    |> NaiveDateTime.truncate(:second)
  end

  defp _max_number(), do: Enum.random(0..100)
end
