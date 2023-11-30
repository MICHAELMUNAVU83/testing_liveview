defmodule TestingLiveview.Factory do
  @moduledoc """
  Generates builds and inserts data for use in tests
  """
  alias TestingLiveview.Posts.Post
  alias TestingLiveview.Repo

  def build(:post) do
    %Post{
      title: "This is the title",
      description: "This is the description",
    }
  end

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attrs \\ []) do
    factory_name |> build(attrs) |> Repo.insert!()
  end
end
