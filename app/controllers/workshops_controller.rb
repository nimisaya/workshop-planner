class WorkshopsController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  # CREATE
  def new
    @workshop = Workshop.new
  end # new

  def create
    workshop = Workshop.new workshop_params
    # Set signed in user as workshop creator
    workshop.user_id = @current_user.id
    workshop.save
    redirect_to workshop_path(workshop.id)
  end # create

  # READ
  def index
    @workshops = Workshop.all
    @workshops_personal = Workshop.where(user_id: @current_user.id)
    # @templates = Workshop.where(user_id: nil)
    # other_users_workshops = Workshop.where.not(user_id: @current_user.id)
    # @workshops_public = other_users_workshops.where(private: false)
  end # index

  def show
    @workshop = Workshop.find params[:id]
    @workshop_time = seconds_to_string(@workshop.total_time) unless @workshop.total_time == nil
  end # show
  
  # UPDATE
  def edit
    @workshop = Workshop.find params[:id]
    # Prevent user from editing workshop if they did not create it
    redirect_to login_path unless @workshop.user.id == @current_user.id
  end # edit
  
  def update
    workshop = Workshop.find params[:id]
    
    # Prevent edit from being committed unless it is the user who created the task
    redirect_to login_path and return unless workshop.user_id == @current_user.id

    workshop.update workshop_params
    redirect_to workshop_path(workshop.id)
  end # update

  def edit_tasks
    @workshop = Workshop.find params[:id]
    @tasks = Task.all
  end # edit_tasks

  # DELETE
  def destroy
    Workshop.destroy params[:id]
    redirect_to workshops_path
  end # destroy

  def clone
    # Retrieve the workshop the user wants to clone
    original_workshop = Workshop.find params[:id]

    # Clone the workshop using duplicate
    clone_workshop = original_workshop.dup

    # Assign the clone to the current user
    clone_workshop.user_id = @current_user.id
    
    # Loop through the original workshops tasks
    original_workshop.tasks.each do |task|
      # Duplicate task
      clone_task = task.dup
      # Set user id to current user
      clone_task.user_id = @current_user.id
      # Set workshop id to clone_workshop.id
      clone_task.workshops << clone_workshop
      # Commit to database
      clone_task.save
    end


    # TODO: BUT WHAT HAPPENS IF THE USER ALREADY HAS THIS EXACT TASK? HOW DO I HANDLE JUST SETTING THE TASK >-< WORKSHOP RELATIONSHIP instead of giving them duplicates of the task that show up?

    # Commit to the database
    clone_workshop.save

    # Show workshop -> Created by should be current user instead of original creator
    redirect_to workshop_path(clone_workshop.id)
  end

  private

  def workshop_params
    params.require(:workshop).permit(:title, :description, :private, {task_ids: []})
  end # workshop_params
end # WorkshopsController
