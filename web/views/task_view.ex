defmodule ChannelsDemo.TaskView do
  use ChannelsDemo.Web, :view

  def render("task.json", %{task: t}) do
    %{
      id: t.id,
      date: t.date,
      description: t.description
    }
  end
end