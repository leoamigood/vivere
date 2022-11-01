defmodule VivereWeb.TraceLiveTest do
  use VivereWeb.ConnCase

  import Phoenix.LiveViewTest
  import Vivere.SurfBoardFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_trace(_) do
    trace = trace_fixture()
    %{trace: trace}
  end

  describe "Index" do
    setup [:create_trace]

    test "lists all traces", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.trace_index_path(conn, :index))

      assert html =~ "Listing Traces"
    end

    test "saves new trace", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.trace_index_path(conn, :index))

      assert index_live |> element("a", "New Trace") |> render_click() =~
               "New Trace"

      assert_patch(index_live, Routes.trace_index_path(conn, :new))

      assert index_live
             |> form("#trace-form", trace: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#trace-form", trace: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.trace_index_path(conn, :index))

      assert html =~ "Trace created successfully"
    end

    test "updates trace in listing", %{conn: conn, trace: trace} do
      {:ok, index_live, _html} = live(conn, Routes.trace_index_path(conn, :index))

      assert index_live |> element("#trace-#{trace.id} a", "Edit") |> render_click() =~
               "Edit Trace"

      assert_patch(index_live, Routes.trace_index_path(conn, :edit, trace))

      assert index_live
             |> form("#trace-form", trace: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#trace-form", trace: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.trace_index_path(conn, :index))

      assert html =~ "Trace updated successfully"
    end

    test "deletes trace in listing", %{conn: conn, trace: trace} do
      {:ok, index_live, _html} = live(conn, Routes.trace_index_path(conn, :index))

      assert index_live |> element("#trace-#{trace.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#trace-#{trace.id}")
    end
  end

  describe "Show" do
    setup [:create_trace]

    test "displays trace", %{conn: conn, trace: trace} do
      {:ok, _show_live, html} = live(conn, Routes.trace_show_path(conn, :show, trace))

      assert html =~ "Show Trace"
    end

    test "updates trace within modal", %{conn: conn, trace: trace} do
      {:ok, show_live, _html} = live(conn, Routes.trace_show_path(conn, :show, trace))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Trace"

      assert_patch(show_live, Routes.trace_show_path(conn, :edit, trace))

      assert show_live
             |> form("#trace-form", trace: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#trace-form", trace: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.trace_show_path(conn, :show, trace))

      assert html =~ "Trace updated successfully"
    end
  end
end
