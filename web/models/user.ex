require IEx
defmodule PhoenixBase.User do
  @moduledoc """
    User schema
  """

  use PhoenixBase.Web, :model
  alias Comeonin.Bcrypt

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
    |> cast(params, ~w(name email password)a)
    |> unique_constraint(:name)
    |> validate_length(:password, min: 6)
    |> hash_password
    |> validate_required(~w(name password)a)
  end

  defp hash_password(changeset) do
    case get_change(changeset, :password) do
      p when is_nil(p) -> changeset
      p -> changeset |> put_change(:encrypted_password, p |> Bcrypt.hashpwsalt)
    end
  end
end
