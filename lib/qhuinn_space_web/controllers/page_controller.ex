defmodule QhuinnSpaceWeb.PageController do
  use QhuinnSpaceWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
