class User < ActiveRecord::Base
  has_many :trips
  has_many :friendships

  validates :name, presence: true
  validates :email, uniqueness: true
end
