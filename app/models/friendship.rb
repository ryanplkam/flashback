class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => 'user_id'

  validates :user, presence: true
  validates :friend, presence: true
end
