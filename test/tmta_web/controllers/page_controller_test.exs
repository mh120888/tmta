defmodule TmtaWeb.PageControllerTest do
  use TmtaWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    response = html_response(conn, 200)
    assert response =~ "TMTA"
    assert response =~ "Helping you keep track of your vacations"
    assert response =~ "<a href=\"#\" class=\"btn btn-primary\">Add a Trip</a>"
  end
end
