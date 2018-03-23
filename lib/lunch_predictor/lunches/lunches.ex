defmodule LunchPredictor.Lunches do
  @moduledoc """
  The Lunches context.
  """

  import Ecto.Query, warn: false
  alias LunchPredictor.Repo

  alias LunchPredictor.Lunches.Lunch

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
end
