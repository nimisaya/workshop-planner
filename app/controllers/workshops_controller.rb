class WorkshopsController < ApplicationController
  def new
    @workshop = Workshop.new
  end # new

  def create
    workshop = Workshop.new workshop_params
    workshop.save
    redirect_to workshop_path(workshop.id)
  end # create

  def index
    @workshops = Workshop.all
  end # index

  def show
    @workshop = Workshop.find params[:id]
    @workshop_time = seconds_to_string(@workshop.total_time) unless @workshop.total_time == nil
  end # show

  def edit
  end # edit

  def update
  end # update

  def destroy
  end # destroy

  def workshop_params
    params.require(:workshop).permit(:title, :description, :private)
  end # workshop_params
end # WorkshopsController
