defmodule PhoenixBase.ErrorHandler do
  @moduledoc """
    Handle Guardian errors
  """

  use PhoenixBase.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "Can not proceed without sign in")
    |> redirect(to: "/sessions/new")
  end

  def already_authenticated(conn, _params) do
    conn |> put_flash(:error, "Was already authentiated") |> redirect(to: "/")
  end
end
