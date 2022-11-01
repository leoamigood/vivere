defmodule Vivere.SurfBoardTest do
  use Vivere.DataCase

  alias Vivere.SurfBoard

  describe "traces" do
    alias Vivere.SurfBoard.Trace

    import Vivere.SurfBoardFixtures

    @invalid_attrs %{}

    test "list_traces/0 returns all traces" do
      trace = trace_fixture()
      assert SurfBoard.list_traces() == [trace]
    end

    test "get_trace!/1 returns the trace with given id" do
      trace = trace_fixture()
      assert SurfBoard.get_trace!(trace.id) == trace
    end

    test "create_trace/1 with valid data creates a trace" do
      valid_attrs = %{}

      assert {:ok, %Trace{} = trace} = SurfBoard.create_trace(valid_attrs)
    end

    test "create_trace/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SurfBoard.create_trace(@invalid_attrs)
    end

    test "update_trace/2 with valid data updates the trace" do
      trace = trace_fixture()
      update_attrs = %{}

      assert {:ok, %Trace{} = trace} = SurfBoard.update_trace(trace, update_attrs)
    end

    test "update_trace/2 with invalid data returns error changeset" do
      trace = trace_fixture()
      assert {:error, %Ecto.Changeset{}} = SurfBoard.update_trace(trace, @invalid_attrs)
      assert trace == SurfBoard.get_trace!(trace.id)
    end

    test "delete_trace/1 deletes the trace" do
      trace = trace_fixture()
      assert {:ok, %Trace{}} = SurfBoard.delete_trace(trace)
      assert_raise Ecto.NoResultsError, fn -> SurfBoard.get_trace!(trace.id) end
    end

    test "change_trace/1 returns a trace changeset" do
      trace = trace_fixture()
      assert %Ecto.Changeset{} = SurfBoard.change_trace(trace)
    end
  end
end
