# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
School.create!(name: "Berkeley High School", city: "Berkeley", state: "CA", zip:"94709")
School.create!(name:  "Richmond High School", city: "Richmond", state: "CA", zip:"94806")
