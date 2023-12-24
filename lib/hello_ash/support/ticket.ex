defmodule HelloAsh.Support.Ticket do
  use Ash.Resource

  actions do
    defaults [:create, :read, :update, :destroy]

    create :open do
        accept [:subject]
    end
    
    create :open_with_status do
        accept [:subject, :status]
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :subject, :string do
      allow_nil? false
    end

    attribute :status, :atom do
        constraints [one_of: [:open, :closed]]
        default :open
        allow_nil? false
    end
  end
end
