defmodule TmtaWeb.PageControllerTest do
  use TmtaWeb.ConnCase, async: true
  alias Tmta.Coherence.User
  alias Tmta.Repo

  describe "Given any user" do
    test "GET / displays TMTA and the welcome text", %{conn: conn} do
      conn = get conn, "/"
      response = html_response(conn, 200)
      assert response =~ "TMTA"
      assert response =~ "Helping you keep track of your vacations"
    end
  end

  describe "Given a guest user" do
    test "GET / displays Sign In and Sign Up links", %{conn: conn} do
      conn = get conn, "/"
      response = html_response(conn, 200)
      assert response =~ "Sign In"
      assert response =~ "Sign Up"
    end
  end

  describe "Given a logged in user" do
    setup [:create_user_and_log_in]
    test "GET / displays the current user's name", %{conn: conn} do
      conn = get conn, "/"
      response = html_response(conn, 200)
      assert response =~ "Bob Smith"
    end
  end

  defp create_user_and_log_in(m) do
    user = User.changeset(%User{}, %{name: "Bob Smith", email: "test@example.com", password: "test", password_confirmation: "test"})
    |> Repo.insert!
    {:ok, conn: assign(m.conn, :current_user, user), user: user}
  end
end
