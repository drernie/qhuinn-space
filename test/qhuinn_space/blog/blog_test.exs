defmodule QhuinnSpace.BlogTest do
  use QhuinnSpace.DataCase

  alias QhuinnSpace.Blog

  describe "stories" do
    alias QhuinnSpace.Blog.Story

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def story_fixture(attrs \\ %{}) do
      {:ok, story} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_story()

      story
    end

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Blog.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Blog.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      assert {:ok, %Story{} = story} = Blog.create_story(@valid_attrs)
      assert story.body == "some body"
      assert story.title == "some title"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      assert {:ok, story} = Blog.update_story(story, @update_attrs)
      assert %Story{} = story
      assert story.body == "some updated body"
      assert story.title == "some updated title"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_story(story, @invalid_attrs)
      assert story == Blog.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Blog.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Blog.change_story(story)
    end
  end
end
