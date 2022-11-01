defmodule Vivere.SurfBoard do
  @moduledoc """
  The SurfBoard context.
  """

  import Ecto.Query, warn: false
  alias Vivere.NexumRepo

  alias Vivere.SurfBoard.Trace

  @doc """
  Returns the list of traces.

  ## Examples

      iex> list_traces()
      [%Trace{}, ...]

  """
  def last_traces(number) do
    query = from l in Trace,
                 order_by: [desc: :created_at],
                 limit: ^number
    NexumRepo.all(query)
  end

  @doc """
  Gets a single trace.

  Raises `Ecto.NoResultsError` if the Trace does not exist.

  ## Examples

      iex> get_trace!(123)
      %Trace{}

      iex> get_trace!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trace!(id), do: NexumRepo.get!(Trace, id)
end
