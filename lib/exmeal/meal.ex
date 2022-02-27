defmodule  Exmeal.Meal do

  
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:description, :date, :calories]

  schema("meals") do
    field :description, :string
    field :date, :date
    field :calories, :integer

    timestamps()
  end


  def changeset(meal \\ %__MODULE__{}, params) do
    meal
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, max: 255)
  end

end
