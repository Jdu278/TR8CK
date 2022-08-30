class Habit < ApplicationRecord
  belongs_to :user
  has_many :reminders, dependent: :destroy
  has_many :habit_sessions, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
