defmodule TestingLiveviewWeb.PostLive.Index do
  use TestingLiveviewWeb, :live_view
  alias TestingLiveview.Posts
  alias TestingLiveview.Posts.Post

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:changeset, Posts.change_post(%Post{}))
     |> assign(:posts, Posts.list_posts())}
  end

  def handle_event("search", %{"post" => %{"search" => query}}, socket) do
    posts =
      Posts.list_posts()
      |> Enum.filter(fn post ->
        String.contains?(String.downcase(post.title), String.downcase(query))
      end)

    {:noreply, socket |> assign(:posts, posts)}
  end
end
