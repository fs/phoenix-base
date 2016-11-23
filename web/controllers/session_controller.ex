defmodule PhoenixBase.SessionController do
  @moduledoc """
    Session controller
  """

  use PhoenixBase.Web, :controller
  alias PhoenixBase.User

  def new(conn, _params), do: render conn, "new.html"

  def create(conn, params) do
  end

  def destroy(conn, params) do
  end
end
