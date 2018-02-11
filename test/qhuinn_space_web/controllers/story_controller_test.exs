defmodule QhuinnSpaceWeb.StoryControllerTest do
  use QhuinnSpaceWeb.ConnCase

  alias QhuinnSpace.Blog

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  def fixture(:story) do
    {:ok, story} = Blog.create_story(@create_attrs)
    story
  end

  describe "index" do
    test "lists all stories", %{conn: conn} do
      conn = get conn, story_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Stories"
    end
  end

  describe "new story" do
    test "renders form", %{conn: conn} do
      conn = get conn, story_path(conn, :new)
      assert html_response(conn, 200) =~ "New Story"
    end
  end

  describe "create story" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, story_path(conn, :create), story: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == story_path(conn, :show, id)

      conn = get conn, story_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Story"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, story_path(conn, :create), story: @invalid_attrs
      assert html_response(conn, 200) =~ "New Story"
    end
  end

  describe "edit story" do
    setup [:create_story]

    test "renders form for editing chosen story", %{conn: conn, story: story} do
      conn = get conn, story_path(conn, :edit, story)
      assert html_response(conn, 200) =~ "Edit Story"
    end
  end

  describe "update story" do
    setup [:create_story]

    test "redirects when data is valid", %{conn: conn, story: story} do
      conn = put conn, story_path(conn, :update, story), story: @update_attrs
      assert redirected_to(conn) == story_path(conn, :show, story)

      conn = get conn, story_path(conn, :show, story)
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, story: story} do
      conn = put conn, story_path(conn, :update, story), story: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Story"
    end
  end

  describe "delete story" do
    setup [:create_story]

    test "deletes chosen story", %{conn: conn, story: story} do
      conn = delete conn, story_path(conn, :delete, story)
      assert redirected_to(conn) == story_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, story_path(conn, :show, story)
      end
    end
  end

  defp create_story(_) do
    story = fixture(:story)
    {:ok, story: story}
  end
end
