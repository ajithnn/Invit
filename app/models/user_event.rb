class UserEvent < ActiveRecord::Base
  rolify
  has_many :users
  has_many :events
  belongs_to :role, :autosave => true

  attr_accessible :user_id, :event_id, :role_id ,:user_event_message
end
