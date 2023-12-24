require Ash.Query

defmodule HelloAshTest do
  use ExUnit.Case

  doctest HelloAsh

  test "greets the world" do

    ticket = HelloAsh.Support.Ticket
      |> Ash.Changeset.for_create(:open, %{subject: "not working"})
      |> HelloAsh.Support.create!()
    
    ticket |> IO.inspect()
  end
end
