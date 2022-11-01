defmodule VivereWeb.TraceLive.Index do
  use VivereWeb, :live_view

  alias Vivere.SurfBoard
  alias Vivere.SurfBoard.Trace

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :traces, list_traces())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Trace")
    |> assign(:trace, SurfBoard.get_trace!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Trace")
    |> assign(:trace, %Trace{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Traces")
    |> assign(:trace, nil)
  end

  defp list_traces do
    SurfBoard.last_traces(5)
  end
end
