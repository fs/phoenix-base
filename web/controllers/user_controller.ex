defmodule PhoenixBase.User do
  use PhoenixBase.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", users: Repo.all(User)
  end
end
