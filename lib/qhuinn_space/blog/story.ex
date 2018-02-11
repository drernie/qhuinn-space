defmodule QhuinnSpace.Blog.Story do
  use Ecto.Schema
  import Ecto.Changeset
  alias QhuinnSpace.Blog.Story


  schema "stories" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Story{} = story, attrs) do
    story
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
