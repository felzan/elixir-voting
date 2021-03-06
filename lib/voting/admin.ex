defmodule Voting.Admin do
  @moduledoc false
  use Ecto.Schema

  schema "administrators" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end
end
