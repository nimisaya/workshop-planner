class WorkshopsController < ApplicationController
  def new
    @workshop = Workshop.new
  end

  def create
  end

  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find params[:id]
    @workshop_time = seconds_to_string(@workshop.total_time)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
