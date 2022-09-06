class HabitSession < ApplicationRecord
  belongs_to :habit

  validates :repetitions, numericality: { greater_than_or_equal_to: 0 }, if:
  Proc.new { |item| item.habit.needed_session_properties.include?("repetitions") }
  validates :duration, numericality: { greater_than_or_equal_to: 0 }, if:
  Proc.new { |item| item.habit.needed_session_properties.include?("note") }
  validates :note, numericality: { in: 1..5 }, if:
  Proc.new { |item| item.habit.needed_session_properties.include?("mood") }
  validates :note, length: { maximum: 280 }
end
