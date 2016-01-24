class Role < ActiveRecord::Base

  has_many :user_events, :autosave => true
  scopify
end
