defmodule ChannelsDemo.TaskChannel do
  use ChannelsDemo.Web, :channel
  alias ChannelsDemo.Task
  alias ChannelsDemo.TaskView

  def join("tasks:filterBy", params, socket) do
    {:ok, find_tasks_by_date(params), assign(socket, :task_params, params)}
  end

  def handle_in("new_task", params, socket) do
    changeset = Task.changeset(%Task{}, params)

    case Repo.insert changeset do
      {:ok, task} ->
        broadcast_one_by_params(task, socket.assigns.task_params, socket)
        {:reply, :ok, socket}

      {:error, changeset} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end

  def handle_in("new_query_params", params, socket) do
    broadcast! socket, "all_tasks", find_tasks_by_date(params)
    {:reply, :ok, assign(socket, :task_params, params)}
  end

  defp broadcast_one_by_params(task, params, socket) do
    date = Ecto.Date.to_string task.date
    if date >= params["initialDate"] && date <= params["finalDate"] do
      broadcast! socket, "new_task", TaskView.render("task.json", %{task: task})
    end
  end

  defp find_tasks_by_date(params) do
     tasks = Repo.all from t in Task, where: t.date >= ^params["initialDate"], where: t.date <= ^params["finalDate"]
     %{tasks: Phoenix.View.render_many(tasks, TaskView, "task.json")}
  end
end
