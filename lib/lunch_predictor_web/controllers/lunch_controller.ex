defmodule LunchPredictorWeb.LunchController do
  use LunchPredictorWeb, :controller

  alias LunchPredictor.Lunches
  alias LunchPredictor.Lunches.Lunch

  def index(conn, _params) do
    lunches = Lunches.list_lunches()
    render(conn, "index.html", lunches: lunches)
  end

  def new(conn, _params) do
    changeset = Lunches.change_lunch(%Lunch{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lunch" => lunch_params}) do
    case Lunches.create_lunch(lunch_params) do
      {:ok, lunch} ->
        conn
        |> put_flash(:info, "Lunch created successfully.")
        |> redirect(to: lunch_path(conn, :show, lunch))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lunch = Lunches.get_lunch!(id)
    render(conn, "show.html", lunch: lunch)
  end

  def edit(conn, %{"id" => id}) do
    lunch = Lunches.get_lunch!(id)
    changeset = Lunches.change_lunch(lunch)
    render(conn, "edit.html", lunch: lunch, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lunch" => lunch_params}) do
    lunch = Lunches.get_lunch!(id)

    case Lunches.update_lunch(lunch, lunch_params) do
      {:ok, lunch} ->
        conn
        |> put_flash(:info, "Lunch updated successfully.")
        |> redirect(to: lunch_path(conn, :show, lunch))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lunch: lunch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lunch = Lunches.get_lunch!(id)
    {:ok, _lunch} = Lunches.delete_lunch(lunch)

    conn
    |> put_flash(:info, "Lunch deleted successfully.")
    |> redirect(to: lunch_path(conn, :index))
  end
end
