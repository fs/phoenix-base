defmodule PhoenixBase.Session do
  @moduledoc """
    Session helpers
  """

  alias Guardian.Plug

  def current_user(conn) do
    Plug.current_resource(conn)
  end

  def logged_in?(conn), do: !!current_user(conn)
end
