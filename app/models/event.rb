class Event < ActiveRecord::Base

  attr_accessible :name,:event_date,:location_name,:location_marker,:event_img,:event_message

  has_and_belongs_to_many :users, :join_table => :user_events
end
