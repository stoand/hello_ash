require Ash.Query

defmodule HelloAshTest do
  use ExUnit.Case

  doctest HelloAsh

  test "greets the world" do
    ticket =
      HelloAsh.Support.Ticket
      |> Ash.Changeset.for_create(:open, %{subject: "not working"})
      |> HelloAsh.Support.create!()

    # ticket |> IO.inspect()

    updated_ticket =
      ticket
      |> Ash.Changeset.for_update(:update, %{subject: "working"})
      |> HelloAsh.Support.update!()

    # updated_ticket |> IO.inspect()

    HelloAsh.Support.Ticket
    |> Ash.Query.filter(status == :open)
    # |> Ash.DataLayer.Simple.set_data([ticket, updated_ticket])
    |> HelloAsh.Support.read!()
    |> IO.inspect()
  end
end
