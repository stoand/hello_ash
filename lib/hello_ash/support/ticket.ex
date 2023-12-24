defmodule HelloAsh.Support.Ticket do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults [:create, :read, :update, :destroy]

    create :open do
      accept [:subject]
    end

    create :open_with_status do
      accept :all
      require_attributes [:status]
    end

    update :close do
      reject :all

      change set_attribute(:status, :closed)
    end

    update :assign do
      reject :all

      argument :representative_id, :uuid do
        allow_nil? false
      end

      change manage_relationship(:representative_id, :representative, type: :append_and_remove)
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :subject, :string do
      allow_nil? false
    end

    attribute :status, :atom do
      constraints one_of: [:open, :closed]
      default :open
      allow_nil? false
    end
  end

  relationships do
    belongs_to :representative, HelloAsh.Support.Representative
  end
end
