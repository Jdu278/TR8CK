class Reminder < ApplicationRecord
  belongs_to :habit
  validates :time, presence: true
end
