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

  # DELETE
  def destroy
    Workshop.destroy params[:id]
    redirect_to workshops_path
  end # destroy

  private

  def workshop_params
    params.require(:workshop).permit(:title, :description, :private)
  end # workshop_params
end # WorkshopsController
