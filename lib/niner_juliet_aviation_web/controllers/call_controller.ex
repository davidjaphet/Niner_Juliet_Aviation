defmodule NinerJulietAviationWeb.CallController do
  use NinerJulietAviationWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
