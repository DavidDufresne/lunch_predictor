defmodule LunchPredictor.Lunches do
  @moduledoc """
  The Lunches context.
  """

  import Ecto.Query, warn: false
  alias LunchPredictor.Repo

  alias LunchPredictor.Lunches.Lunch
  alias LunchPredictor.Lunches.Provider

  @doc """
  Returns the list of lunches.

  ## Examples

      iex> list_lunches()
      [%Lunch{}, ...]

  """
  def list_lunches do
    Repo.all(Lunch)
  end

  @doc """
  Gets a single lunch.

  Raises `Ecto.NoResultsError` if the Lunch does not exist.

  ## Examples

      iex> get_lunch!(123)
      %Lunch{}

      iex> get_lunch!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lunch!(id), do: Repo.get!(Lunch, id)

  @doc """
  Creates a lunch.

  ## Examples

      iex> create_lunch(%{field: value})
      {:ok, %Lunch{}}

      iex> create_lunch(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lunch(attrs \\ %{}) do
    %Lunch{}
    |> Lunch.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lunch.

  ## Examples

      iex> update_lunch(lunch, %{field: new_value})
      {:ok, %Lunch{}}

      iex> update_lunch(lunch, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lunch(%Lunch{} = lunch, attrs) do
    lunch
    |> Lunch.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lunch.

  ## Examples

      iex> delete_lunch(lunch)
      {:ok, %Lunch{}}

      iex> delete_lunch(lunch)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lunch(%Lunch{} = lunch) do
    Repo.delete(lunch)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lunch changes.

  ## Examples

      iex> change_lunch(lunch)
      %Ecto.Changeset{source: %Lunch{}}

  """
  def change_lunch(%Lunch{} = lunch) do
    Lunch.changeset(lunch, %{})
  end

  def load_provider(schema) do
    Repo.preload(schema, :provider)
  end

  def with_provider_id(query, provider_id) do
    from l in query,
      where: l.provider_id == ^provider_id
  end

  def number_of_lunches_with_provider_id(provider_id) do
    Lunch
    |> with_provider_id(provider_id)
    |> Repo.aggregate(:count, :id)
  end

  def number_of_lunches do
    Lunch
    |> Repo.aggregate(:count, :id)
  end

    @doc """
  Returns the list of providers.

  ## Examples

      iex> list_providers()
      [%Provider{}, ...]

  """
  def list_providers do
    Repo.all(Provider)
  end

  @doc """
  Gets a single provider.

  Raises `Ecto.NoResultsError` if the Provider does not exist.

  ## Examples

      iex> get_provider!(123)
      %Provider{}

      iex> get_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_provider!(id), do: Repo.get!(Provider, id)

  @doc """
  Creates a provider.

  ## Examples

      iex> create_provider(%{field: value})
      {:ok, %Provider{}}

      iex> create_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_provider(attrs \\ %{}) do
    %Provider{}
    |> Provider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a provider.

  ## Examples

      iex> update_provider(provider, %{field: new_value})
      {:ok, %Provider{}}

      iex> update_provider(provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_provider(%Provider{} = provider, attrs) do
    provider
    |> Provider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Provider.

  ## Examples

      iex> delete_provider(provider)
      {:ok, %Provider{}}

      iex> delete_provider(provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_provider(%Provider{} = provider) do
    Repo.delete(provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking provider changes.

  ## Examples

      iex> change_provider(provider)
      %Ecto.Changeset{source: %Provider{}}

  """
  def change_provider(%Provider{} = provider) do
    Provider.changeset(provider, %{})
  end
end
