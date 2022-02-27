defmodule Exmeal.Meals.Create do

  alias Exmeal.Repo
  alias Exmeal.Meal
  alias Exmeal.Error

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  def handle_insert({:ok, %Meal{}} = result), do: result 
  def handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
