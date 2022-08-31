# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "purging database..."

Habit.destroy_all
User.destroy_all
HabitSession.destroy_all
Reminder.destroy_all
puts "done!"
puts "___________________________________________"

puts "creating user:"
user = User.create!(
  email: "stringi@test.com",
  password: "123456"
)

puts user.email
puts "user created"
puts "___________________________________________"

puts "creating habits:"

habit =  Habit.new(
  title: "call grandma",
  description: "Doing regular pullups",
  needed_session_properties: ["note", "mood"]
)
habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  note: "#{habit.title} test Note",
  mood: 3,
  duration: 30
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  note: "#{habit.title} test Note 2",
  mood: 5,
  duration: 60
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit =  Habit.new(
  title: "Push-ups",
  description: "Doing regular pushups",
  needed_session_properties: ["repetitions", "note", "mood"]
)
habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  repetitions: 5,
  note: "#{habit.title} test Note",
  mood: 3,
  duration: 30
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  repetitions: 10,
  note: "#{habit.title} test Note 2",
  mood: 5,
  duration: 60
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit =  Habit.new(
  title: "Pull-ups",
  description: "Doing regular pullups",
  needed_session_properties: ["repetitions", "note", "mood"]
)
habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  repetitions: 5,
  note: "#{habit.title} test Note",
  mood: 3,
  duration: 30
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  repetitions: 10,
  note: "#{habit.title} test Note 2",
  mood: 5,
  duration: 60
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit =  Habit.new(
  title: "floss teeth",
  description: "keep 'em shiny!",
  needed_session_properties: ["duration", "note", "mood"]
)
habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  note: "#{habit.title} test Note",
  mood: 3,
  duration: 30
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  note: "#{habit.title} test Note 2",
  mood: 5,
  duration: 60
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

puts "___________________________________________"
puts "seeds done!"
