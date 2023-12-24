defmodule HelloAsh.Support do
  use Ash.Api

  resources do
    resource HelloAsh.Support.Ticket
    resource HelloAsh.Support.Representative
  end
end
