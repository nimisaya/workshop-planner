class WorkshopsController < ApplicationController
  # CREATE
  def new
    @workshop = Workshop.new
  end # new

  def create
    workshop = Workshop.new workshop_params
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
  end # edit
  
  def update
    workshop = Workshop.find params[:id]
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
