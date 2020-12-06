class TasksController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  # CREATE
  def new
    @task = Task.new
  end # new

  def create
    task = Task.new task_params
    # Set signed in user as task creator
    task.user_id = @current_user.id
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
    # Prevent user from accessing edit functionality if they did not create the task
    redirect_to login_path unless @task.user.id == @current_user.id
  end # edit

  def update
    task = Task.find params[:id]

    # Prevent the edit from being committed unless it is the user who created the task
    redirect_to login_path and return unless task.user_id == @current_user.id

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
