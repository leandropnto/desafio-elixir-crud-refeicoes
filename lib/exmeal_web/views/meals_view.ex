defmodule ExmealWeb.MealsView do
  use ExmealWeb, :view

  # import Ecto.Changeset, only: [traverse_errors: 2]

  def render("create.json", %{meal: meal}) do
    %{message: "Meal created!", meal: %{meal: meal}}
  end

  def render("meal.json", %{meal: meal}) do
    %{
      meal: meal
    }
  end

  def render("update.json", %{meal: meal}) do
    %{
      meal: meal
    }
  end
end
