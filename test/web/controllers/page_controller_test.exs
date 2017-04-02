defmodule PhoenixBase.Web.PageControllerTest do
  use PhoenixBase.Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Phoenix Base"
  end
end
