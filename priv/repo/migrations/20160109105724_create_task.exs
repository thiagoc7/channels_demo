defmodule ChannelsDemo.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :date, :date
      add :description, :string

      timestamps
    end

  end
end
