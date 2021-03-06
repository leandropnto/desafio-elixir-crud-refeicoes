defmodule Exmeal.Meals.Update do
  alias Exmeal.Repo
  alias Exmeal.Meal
  alias Ecto.Changeset
  alias Exmeal.Error

  def call(%{"id" => id} = params) do
    with %Meal{} = meal <- Repo.get(Meal, id),
         %Changeset{valid?: true} = changeset <- Meal.changeset(meal, params),
         {:ok, meal} <- Repo.update(changeset) do
      {:ok, meal}
    else
      %Changeset{valid?: false} = error ->
        {:error, Error.build(:bad_request, error)}

      nil ->
        {:error, Error.build_meal_not_found_error(id)}
    end
  end
end
