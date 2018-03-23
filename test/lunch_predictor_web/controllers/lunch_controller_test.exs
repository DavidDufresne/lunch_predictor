defmodule LunchPredictorWeb.LunchControllerTest do
  use LunchPredictorWeb.ConnCase

  alias LunchPredictor.Lunches

  @create_attrs %{date: ~D[2010-04-17]}
  @update_attrs %{date: ~D[2011-05-18]}
  @invalid_attrs %{date: nil}

  def fixture(:lunch) do
    {:ok, lunch} = Lunches.create_lunch(@create_attrs)
    lunch
  end

  describe "index" do
    test "lists all lunches", %{conn: conn} do
      conn = get conn, lunch_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Lunches"
    end
  end

  describe "new lunch" do
    test "renders form", %{conn: conn} do
      conn = get conn, lunch_path(conn, :new)
      assert html_response(conn, 200) =~ "New Lunch"
    end
  end

  describe "create lunch" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, lunch_path(conn, :create), lunch: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == lunch_path(conn, :show, id)

      conn = get conn, lunch_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Lunch"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, lunch_path(conn, :create), lunch: @invalid_attrs
      assert html_response(conn, 200) =~ "New Lunch"
    end
  end

  describe "edit lunch" do
    setup [:create_lunch]

    test "renders form for editing chosen lunch", %{conn: conn, lunch: lunch} do
      conn = get conn, lunch_path(conn, :edit, lunch)
      assert html_response(conn, 200) =~ "Edit Lunch"
    end
  end

  describe "update lunch" do
    setup [:create_lunch]

    test "redirects when data is valid", %{conn: conn, lunch: lunch} do
      conn = put conn, lunch_path(conn, :update, lunch), lunch: @update_attrs
      assert redirected_to(conn) == lunch_path(conn, :show, lunch)

      conn = get conn, lunch_path(conn, :show, lunch)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, lunch: lunch} do
      conn = put conn, lunch_path(conn, :update, lunch), lunch: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Lunch"
    end
  end

  describe "delete lunch" do
    setup [:create_lunch]

    test "deletes chosen lunch", %{conn: conn, lunch: lunch} do
      conn = delete conn, lunch_path(conn, :delete, lunch)
      assert redirected_to(conn) == lunch_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, lunch_path(conn, :show, lunch)
      end
    end
  end

  defp create_lunch(_) do
    lunch = fixture(:lunch)
    {:ok, lunch: lunch}
  end
end
