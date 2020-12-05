class TasksController < ApplicationController
  def new
  end

  def create
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find params[:id]
    @task_time = seconds_to_string @task.time
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
