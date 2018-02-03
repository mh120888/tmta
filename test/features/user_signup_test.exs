defmodule UserSignupTest do
  use TmtaWeb.FeatureCase, async: true

  import Wallaby.Query

  test "A user can sign up for an account", %{session: session} do
    session
    |> resize_window(1200, 800)
    |> visit("/registrations/new")
    |> fill_in(text_field("registration[name]"), with: "Bob Smith")
    |> fill_in(text_field("registration[email]"), with: "bobsmith@example.com")
    |> fill_in(text_field("registration[password]"), with: "password")
    |> fill_in(text_field("registration[password_confirmation]"), with: "password")
    |> click(button("Sign Up"))
    |> assert_has(css(".alert", text: "Registration created successfully"))
  end
end