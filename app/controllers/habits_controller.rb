class HabitsController < ApplicationController
  def index
    @habits=Habit.all

  if params[:creationquery].present?
    @habits = Habit.where("title ILIKE ?", "#{params[:creationquery]}")
    if @habits.length == 0
      respond_to do |format|
        format.html # Follow regular flow of Rails
        format.text { render partial: "list", locals: {habits: @habits}, formats: [:html] }
      end
    end
    return
  end

  if params[:query].present? && params[:creationquery].blank?
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
