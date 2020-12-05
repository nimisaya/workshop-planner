class TasksController < ApplicationController
  # CREATE
  def new
    @task = Task.new
  end # new

  def create
    task = Task.new task_params
    task.save
    redirect_to task_path(task.id)
  end # create

  # READ
  def index
    @tasks = Task.all
  end # index

  def show
    @task = Task.find params[:id]
    @task_time = seconds_to_string @task.time
  end # show

  # UPDATE
  def edit
    @task = Task.find params[:id]
  end # edit

  def update
    task = Task.find params[:id]
    task.update task_params
    redirect_to task_path(task.id)
  end # update

  # DELETE
  def destroy
    Task.destroy params[:id]
    redirect_to tasks_path
  end # destroy

  private

  def task_params
    params.require(:task).permit(:title, :description, :tools, :time, :num_participants, :private)
  end # task_params
end # TasksController
