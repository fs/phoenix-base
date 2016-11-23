defmodule PhoenixBase.SessionController do
  @moduledoc """
    Session controller
  """

  use PhoenixBase.Web, :controller
  alias PhoenixBase.User
  alias Guardian.Plug
  alias Comeonin.Bcrypt

  def new(conn, _params), do: render conn, "new.html"

  def create(conn, params) do
    case find_and_confirm_password(params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Succesfully logged in")
        |> Plug.sign_in(user)
        |> redirect(to: "/")
      {:error} ->
        conn
        |> put_flash(:error, "Can not log in")
        |> render("new.html")
    end
  end

  def destroy(conn, params) do
  end

  defp find_and_confirm_password(%{"session" => %{"name" => name,
    "password" => password}}) do
    user = User |> Repo.get_by(name: name)

    case user && password |> Bcrypt.checkpw(user.encrypted_password) do
      true -> {:ok, user}
      _ -> {:error}
    end
  end
end
