defmodule LunchPredictor.LunchesTest do
  use LunchPredictor.DataCase

  alias LunchPredictor.Lunches

  describe "lunches" do
    alias LunchPredictor.Lunches.Lunch

    @valid_attrs %{date: ~D[2010-04-17]}
    @update_attrs %{date: ~D[2011-05-18]}
    @invalid_attrs %{date: nil}

    def lunch_fixture(attrs \\ %{}) do
      {:ok, lunch} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lunches.create_lunch()

      lunch
    end

    test "list_lunches/0 returns all lunches" do
      lunch = lunch_fixture()
      assert Lunches.list_lunches() == [lunch]
    end

    test "get_lunch!/1 returns the lunch with given id" do
      lunch = lunch_fixture()
      assert Lunches.get_lunch!(lunch.id) == lunch
    end

    test "create_lunch/1 with valid data creates a lunch" do
      assert {:ok, %Lunch{} = lunch} = Lunches.create_lunch(@valid_attrs)
      assert lunch.date == ~D[2010-04-17]
    end

    test "create_lunch/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lunches.create_lunch(@invalid_attrs)
    end

    test "update_lunch/2 with valid data updates the lunch" do
      lunch = lunch_fixture()
      assert {:ok, lunch} = Lunches.update_lunch(lunch, @update_attrs)
      assert %Lunch{} = lunch
      assert lunch.date == ~D[2011-05-18]
    end

    test "update_lunch/2 with invalid data returns error changeset" do
      lunch = lunch_fixture()
      assert {:error, %Ecto.Changeset{}} = Lunches.update_lunch(lunch, @invalid_attrs)
      assert lunch == Lunches.get_lunch!(lunch.id)
    end

    test "delete_lunch/1 deletes the lunch" do
      lunch = lunch_fixture()
      assert {:ok, %Lunch{}} = Lunches.delete_lunch(lunch)
      assert_raise Ecto.NoResultsError, fn -> Lunches.get_lunch!(lunch.id) end
    end

    test "change_lunch/1 returns a lunch changeset" do
      lunch = lunch_fixture()
      assert %Ecto.Changeset{} = Lunches.change_lunch(lunch)
    end
  end
end
