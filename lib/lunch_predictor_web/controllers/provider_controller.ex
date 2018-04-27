defmodule LunchPredictorWeb.ProviderController do
  use LunchPredictorWeb, :controller

  alias LunchPredictor.Lunches
  alias LunchPredictor.Lunches.Provider

  def index(conn, _params) do
    providers = Lunches.list_providers()
    render(conn, "index.html", providers: providers)
  end

  def new(conn, _params) do
    changeset = Lunches.change_provider(%Provider{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"provider" => provider_params}) do
    case Lunches.create_provider(provider_params) do
      {:ok, provider} ->
        conn
        |> put_flash(:info, "Provider created successfully.")
        |> redirect(to: provider_path(conn, :show, provider))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    provider = Lunches.get_provider!(id)
    render(conn, "show.html", provider: provider)
  end

  def edit(conn, %{"id" => id}) do
    provider = Lunches.get_provider!(id)
    changeset = Lunches.change_provider(provider)
    render(conn, "edit.html", provider: provider, changeset: changeset)
  end

  def update(conn, %{"id" => id, "provider" => provider_params}) do
    provider = Lunches.get_provider!(id)

    case Lunches.update_provider(provider, provider_params) do
      {:ok, provider} ->
        conn
        |> put_flash(:info, "Provider updated successfully.")
        |> redirect(to: provider_path(conn, :show, provider))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", provider: provider, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    provider = Lunches.get_provider!(id)
    {:ok, _provider} = Lunches.delete_provider(provider)

    conn
    |> put_flash(:info, "Provider deleted successfully.")
    |> redirect(to: provider_path(conn, :index))
  end
end
