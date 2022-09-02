require 'faker'
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
  title: "Call grandma",
  description: "Best person on the planet!",
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
  title: "Floss teeth",
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


habit =  Habit.new(
  title: "Drink Water",
  description: "Keep yourself hydrated",
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
  mood: 4,
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
  title: "Situps",
  description: "Stay in shape",
  needed_session_properties: ["repetitions", "note", "mood"]
)

habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  repetitions: 20,
  note: "#{habit.title} test Note",
  mood: 2,
  duration: 30
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  repetitions: 35,
  note: "#{habit.title} test Note 2",
  mood: 4,
  duration: 60
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit =  Habit.new(
  title: "Meditation",
  description: "It will help you to stay focused",
  needed_session_properties: ["note", "mood", "duration"]
)

habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  note: "#{habit.title} test Note",
  mood: 4,
  duration: 40
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  note: "#{habit.title} test Note 2",
  mood: 5,
  duration: 50
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note


habit =  Habit.new(
  title: "Read",
  description: "educate yourself",
  needed_session_properties: ["note", "mood", "duration"]
)

habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  note: "#{habit.title} test Note",
  mood: 2,
  duration: 20
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  note: "#{habit.title} test Note 2",
  mood: 3,
  duration: 10
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note


habit =  Habit.new(
  title: "journaling",
  description: "write your journal for today",
  needed_session_properties: ["note", "mood", "duration"]
)

habit.user = user
habit.save!
puts "___________________________________________"
puts "created #{habit.title} habbit:"

puts "___________________________________________"
puts "creating #{habit.title} sessions:"

habit_session = HabitSession.new(
  note: "#{habit.title} test Note",
  mood: 2,
  duration: 20
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  note: "#{habit.title} test Note 2",
  mood: 3,
  duration: 10
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note


70.times do


title_1 = Faker::Hobby.unique.activity
title_2 = Faker::Marketing.buzzwords

 title_3 = rand(1..5)
 title_4 = rand(10..60)


habit =  Habit.new(
  title: title_1,
  description: title_2,
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
  mood: title_3,
  duration: title_4
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

habit_session = HabitSession.new(
  note: "#{habit.title} test Note 2",
  mood: title_3,
  duration: title_4
)
habit_session.habit = habit
habit_session.save!
puts habit_session.note

end




puts "___________________________________________"
puts "seeds done!"
