defmodule PhoenixBase.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, size: 100
      add :encrypted_password, :string, null: false

      timestamps
    end

    create unique_index(:users, [:name])
  end
end
