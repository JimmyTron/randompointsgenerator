defmodule RandomPointsGenerator.CoreTest do
  use RandomPointsGenerator.DataCase
  alias RandomPointsGenerator.Core

  @current_state {~N[2020-12-07 15:08:00], 100}

  test "new/0 returns nil and a random number between 0 and 100" do
    assert {nil, max_number} = Core.new()
    assert max_number in 0..100
  end

  test "update_max_number/1 update value of max_number with random number between 0 and 100" do
    assert {~N[2020-12-07 15:08:00], new_max_number} = Core.update_max_number(@current_state)
    assert new_max_number in 0..100
  end

  test "changes_timestamp/1 changes value of timestamp" do
    assert {new_timestamp, 100} = Core.update_timestamp(@current_state)
    refute new_timestamp == ~N[2020-12-07 15:08:00]
  end
end
