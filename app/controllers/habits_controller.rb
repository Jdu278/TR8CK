class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def show
  end

  def create
  end
end
