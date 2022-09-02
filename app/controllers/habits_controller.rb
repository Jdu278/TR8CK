class HabitsController < ApplicationController
  def index
    @habits = Habit.all

    if params[:query].present?
      @habits = Habit.where("title ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "list", locals: {habits: @habits}, formats: [:html] }
    end
  end


  def show
    @habit = Habit.find(params[:id])
  end

  def create
  end
end
