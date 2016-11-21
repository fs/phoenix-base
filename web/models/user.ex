defmodule PhoenixBase.User do
  @moduledoc """
    User schema
  """

  use PhoenixBase.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :encrypted_password])
    |> validate_required([:name, :password])
    |> unique_constraint(:name)
    |> validate_length(:password, min: 6)
  end
end
