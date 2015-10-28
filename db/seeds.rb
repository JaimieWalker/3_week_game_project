# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

values = [
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "jack",
  "king",
  "queen",
  "ace"
]

suits = [
  "hearts",
  "spades",
  "clubs",
  "diamonds"
]

values.each do |value|
  suits.each do |suit| 
    Card.create( value: value, suit: suit )
  end
end
