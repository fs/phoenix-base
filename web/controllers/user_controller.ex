defmodule PhoenixBase.UserController do
  @moduledoc """
    Users controller actions
  """

  use PhoenixBase.Web, :controller
  alias PhoenixBase.User

  def index(conn, _params) do
    render conn, "index.html", users: Repo.all(User)
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: User.changeset(%User{})
  end
end
