defmodule ChannelsDemo.TaskTest do
  use ChannelsDemo.ModelCase

  alias ChannelsDemo.Task

  @valid_attrs %{date: "2010-04-17", description: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Task.changeset(%Task{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Task.changeset(%Task{}, @invalid_attrs)
    refute changeset.valid?
  end
end
