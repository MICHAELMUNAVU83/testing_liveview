defmodule TestingLiveviewWeb.PostLiveTest do
  @moduledoc false
  use TestingLiveviewWeb.ConnCase

  import Phoenix.LiveViewTest
  alias TestingLiveview.Factory

  describe("Testing the search functionality on the posts page") do
    setup %{conn: conn} do
      post_one =
        Factory.insert!(:post, title: "First Post", description: "This is the first post")

      post_two =
        Factory.insert!(:post, title: "Second Post", description: "This is the second post")

      [post_one: post_one, post_two: post_two]
    end

    test "We see the Counter and initial 0", %{conn: conn, post_one: post_one, post_two: post_two} do
      {:ok, index_live, html} =
        live(
          conn,
          Routes.post_index_path(conn, :index)
        )

      assert html =~ post_one.title
      assert html =~ post_two.title

      searched_html =
        index_live
        |> form("#search-post-filter", post: %{search: "Fi"})
        |> render_change()

      assert searched_html =~ post_one.title
      refute searched_html =~ post_two.title
    end
  end
end
