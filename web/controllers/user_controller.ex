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
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end
end
