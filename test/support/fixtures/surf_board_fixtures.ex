defmodule Vivere.SurfBoardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Vivere.SurfBoard` context.
  """

  @doc """
  Generate a trace.
  """
  def trace_fixture(attrs \\ %{}) do
    {:ok, trace} =
      attrs
      |> Enum.into(%{

      })
      |> Vivere.SurfBoard.create_trace()

    trace
  end
end
