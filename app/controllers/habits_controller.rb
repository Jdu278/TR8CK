class HabitsController < ApplicationController
  def index
    @habits = Habit.all

    if params[:query].present?
      @habits = Habit.where("title ILIKE ?", "%#{params[:query]}%")
    end

    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: "list", locals: {habits: @habits}, formats: [:html] }
    # end
  end

  def show
    @habit = Habit.find(params[:id])
    # @habit_sessions = @habit.habit_sessions
  end

  def create
  end

  def destroy
    @habit = Habit.find(params[:id])
    return unless @habit.user == current_user

    @habit.destroy
    redirect_to habits_path, status: :see_other
  end

  def profile_page
    @habit = Habit.find(params[:id])
  end
end
