# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TestingLiveview.Repo.insert!(%TestingLiveview.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Insert a post

alias TestingLiveview.Posts

Posts.create_post(%{
  title: "first",
  description: "first post"
})


Posts.create_post(%{
  title: "second",
  description: "second post"
})

Posts.create_post(%{
  title: "third",
  description: "third post"
})
