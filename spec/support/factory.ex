defmodule PhoenixBase.Factory do
  use ExMachina.Ecto, repo: PhoenixBase.Repo

  alias Faker.Name
  alias Faker.Internet
  alias PhoenixBase.User

  def user_factory do
    %User{name: Name.name, email: Internet.email, password: Internet.user_name}
  end
end
