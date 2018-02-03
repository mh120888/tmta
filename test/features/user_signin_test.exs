defmodule UserSigninTest do
  use TmtaWeb.FeatureCase, async: true
  alias Tmta.Coherence.User

  import Wallaby.Query

  describe "A user with a valid account" do
    setup do
      user = User.changeset(%User{}, %{name: "Bob Smith", email: "test@example.com", password: "test", password_confirmation: "test"})
      |> Repo.insert!
      {:ok, user: user}
    end

    test "can sign in by providing a valid email and password", %{session: session} do
      session
      |> resize_window(1200, 800)
      |> visit("/sessions/new")
      |> fill_in(text_field("session[email]"), with: "test@example.com")
      |> fill_in(text_field("session[password]"), with: "test")
      |> click(button("Sign In"))
      |> assert_has(Wallaby.Query.text("Bob Smith"))
    end

    test "cannot sign in when providing an valid email or password", %{session: session} do
      session
      |> resize_window(1200, 800)
      |> visit("/sessions/new")
      |> fill_in(text_field("session[email]"), with: "test@example.com")
      |> fill_in(text_field("session[password]"), with: "wrongpassword")
      |> click(button("Sign In"))
      |> assert_has(Wallaby.Query.text("Incorrect email or password"))
    end
  end
end
