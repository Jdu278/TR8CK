# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Habit.destroy_all
User.destroy_all
HabitSession.destroy_all


user = User.create!(
  email: "stringi@test.com",
  password: "123456"
)


habit =  Habit.new(
  title: "Push-ups",
  description: "Doing regular pushups",
  needed_session_properties: ["repetitions", "note", "mood"]
)
habit.user = user
habit.save!

habit =  Habit.new(
  title: "Pull-ups",
  description: "Doing regular pullups",
  needed_session_properties: ["repetitions", "note", "mood"]
)
habit.user = user
habit.save!

puts user.email
puts habit.title

habit_session = HabitSession.new(
  repetitions: 5,
  note: "Test Note",
  mood: 3,
  duration: 30
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  repetitions: 10,
  note: "Test Note 2",
  mood: 5,
  duration: 60
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note
