defmodule Exmeal.Meals.Delete do
  
  alias Ecto.Changeset
  alias Exmeal.{Error, Repo, Meal}
  
  import Logger, only: [debug: 1]
  
  def call(id) do
    with %Meal{} = meal <- Repo.get(Meal, id),
         {:ok, meal} = result <- Repo.delete(meal) do
      debug("Meal #{meal.id} excluído com sucesso!")
      result
    else
      nil ->
        {:error, Error.build_meal_not_found_error(id)}

      {:error, %Changeset{}} ->
        {:error, Error.build(:internal_server_error, "Error trying delete meal.")}
    end
  end
end
