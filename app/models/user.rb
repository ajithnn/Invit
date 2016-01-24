class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  validates_presence_of :name, :email
  
  attr_accessible :name, :email, :password, :password_confirmation, :authentication_token, :created_at 

  has_and_belongs_to_many :events,  :join_table => :user_events
end
