class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new task_params
    task.save
    redirect_to task_path(task.id)
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
    @task_time = seconds_to_string @task.time
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    task.update task_params
    redirect_to task_path(task.id)
  end

  def destroy
  end

  def task_params
    params.require(:task).permit(:title, :description, :tools, :time, :num_participants, :private)
  end # task_params
end
