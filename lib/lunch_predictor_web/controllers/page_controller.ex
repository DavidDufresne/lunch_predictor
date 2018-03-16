defmodule LunchPredictorWeb.PageController do
  use LunchPredictorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
