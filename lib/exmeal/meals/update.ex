defmodule Exmeal.Meals.Update do
  alias Exmeal.Repo
  alias Exmeal.Meal
  alias Ecto.Changeset
  alias Exmeal.Error
  import Logger, only: [debug: 1]

  def call(%{"id" => id} = params) do
    IO.puts("Entrou no update")

    with %Meal{} = meal <- Repo.get(Meal, id),
         %Changeset{valid?: true} = changeset <- Meal.changeset(meal, params),
         {:ok, meal} <- Repo.update(changeset) do
      {:ok, meal}
    else
      %Changeset{valid?: false} = error ->
        {:error, Error.build(:bad_request, translate_errors(error))}

      nil ->
        debug("Entrou aqui!")
        {:error, Error.build_meal_not_found_error(id)}
    end
  end

  defp translate_errors(changeset) do
    Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
  end
end
