# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

puts 'CREATING ROLES'
Role.create([
  { :name => 'Invitor' },
  { :name => 'Invitee' }
])

puts "Creating Users"
User.create({:name => "Ajith", :email => "ajithnn20@gmail.com", :password => 'test123123', :password_confirmation => 'test123123'})
User.create({:name => "Ramya", :email => "ramyaraghuiyengar@gmail.com", :password => '123test123', :password_confirmation => '123test123'})

puts "Creating Events"
Event.create({:name => "Marriage", :location_name => "Basavanagudi" ,:location_marker => "12.009 79.987", :role_id => 0,:event_date => DateTime.new(2016,-04,-20,-00,-45,-00,'+530')})
Event.create({:name => "Reception", :location_name => "Basavanagudi" ,:location_marker => "12.009 79.987", :role_id => 0,:event_date => DateTime.new(2016,-04,-20,-00,-45,-00,'+530')})

