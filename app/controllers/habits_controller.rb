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

    @habit_session = @habit.habit_sessions.where("created_at >?", Date.today - 14).group_by { |session| Date.parse session.created_at.to_s }
    @habit_session_average = @habit_session.transform_values do |value|
      variable = value.pluck(:mood)
      variable.sum / variable.size.to_f
    end
    @habit_session_d_average = @habit_session.transform_values do |value|
      variable = value.pluck(:duration)
      variable.sum / variable.size.to_f
    end
    @habit_session_r_average = @habit_session.transform_values do |value|
      variable = value.pluck(:repetitions)
      # variable.sum / variable.size.to_f
    end
  end

  def create
  end

  def profile_page
    @habit = Habit.find(params[:id])
  end
end
