defmodule TmtaWeb.PageController do
  use TmtaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
