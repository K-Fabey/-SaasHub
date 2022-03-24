# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'
require 'date'

# Destroying existing records
puts "Destroying all the users"
User.destroy_all

puts "Destroying all the companies"
Company.destroy_all

puts "Destroying all the teams"
Team.destroy_all

puts "Destroying all the subscriptions"
Subscription.destroy_all

puts "Destroying all the licences"
Licence.destroy_all

# Creating new companies
puts "Creating Le wagon"
le_wagon = Company.create!(
  name: "Le Wagon",
  address: "30 Villa Gaudelet",
  city: "Paris",
  country: "France",
  siren: "794949917"
)

# Creating users

Thomas = User.create!(
    first_name: "Thomas",
    last_name: "Martin",
    email: "thomas.martin@lewagon.com",
    job_title: "Finance manager",
    status: "Active",
    joining_date: Date.today,
    # team: finance_team
  )

  # Creating teams
finance_team = Team.create!(
  name: "Finance Team",
  company: le_wagon
)


# creating subscriptions

# slack = Subscription.create!(
#   name: "Slack",
#   provider: "Slack inc",
#   price: 5,
#   periodicity: "Monthly",
#   subscription_date: Date.today,
#   renewal_date: Date.today + 365,
#   link: "slack.com",
#   payment_method: "Bank card",
#   purchased_licences: 10,
#   # technical_onwer: Thomas,
#   # functional_onwer: Thomas,
#   # company: Le_wagon
# )
