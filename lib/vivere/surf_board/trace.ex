defmodule Vivere.SurfBoard.Trace do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc false

  schema "traces" do

    field(:name, :string)
    field(:state, :string)

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(trace, attrs) do
    trace
    |> cast(attrs, [])
    |> validate_required([])
  end
end
