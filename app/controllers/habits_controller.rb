class HabitsController < ApplicationController
  def index

    @habits=Habit.all
    @user=current_user

    if  params[:creationquery].present? && Habit.where("title ILIKE ?", "#{params[:creationquery]}").blank?
      partial = "chat"

    elsif params[:creationquery].present? && Habit.where("title ILIKE ?", "#{params[:creationquery]}").present?
      partial = "show"
    else
      partial = "list"
    end

    if params[:query].present?
    @habits = Habit.where("title ILIKE ?", "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: partial, locals: {habits: @habits}, formats: [:html] }
    end
  end

  def create

    @habit = Habit.new(habit_params)
    @habit.user = current_user
    if @habit.save!
      partial = "list"
    else
      flash[:alert] = "something went wrong with the creation process"
      partial = "list"
    end
  end

  def profile_page
    @habit = Habit.find(params[:id])
  end


  private

  def habit_params
    params.permit(:title, :description, :needed_session_properties)
  end
end
