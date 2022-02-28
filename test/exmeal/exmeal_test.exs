defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  alias Ecto.Changeset

  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{description: "Batata", date: "2001-05-02", calories: "20"}

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{description: "Batata", date: ~D[2001-05-02], calories: 20},
               valid?: true
             } = response
    end

    test "when any parameter is invalid, then return mapped error" do
      params = %{description: "Banana", date: "", calories: "20"}
      response = Meal.changeset(params)

      assert %Changeset{
               changes: _changes,
               valid?: false
             } = response
    end
  end
end
