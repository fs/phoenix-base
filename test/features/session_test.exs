defmodule PhoenixBase.Features.Visitor.SignInTest do
  use ExUnit.Case
  use Hound.Helpers
  use PhoenixBase.Web.ConnCase, async: true

  alias PhoenixBase.User
  alias PhoenixBase.Repo
  alias PhoenixBase.Router.Helpers, as: Routes

  hound_session()

  setup do
    User.changeset(%User{}, %{name: "foo", password: "foobar"})
      |> Repo.insert

    :ok
  end

  test "user can sign and sign out", %{conn: conn} do
    navigate_to(Routes.session_path(conn, :new))

    fill_field({:id, "session_name"}, "foo")
    fill_field({:id, "session_password"}, "foobar")

    find_element(:name, "session")
      |> find_within_element(:class, "button")
      |> click()

    assert page_source() =~ "Succesfully logged in"

    find_element(:tag, "nav")
      |> find_within_element(:link_text, "Sign Out")
      |> click()

    assert page_source() =~ "Succesfully logged out"
  end
end
