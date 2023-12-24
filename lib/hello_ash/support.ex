defmodule HelloAsh.Support do
    use Ash.Api

    resources do
        resource HelloAsh.Support.Ticket
    end
end
