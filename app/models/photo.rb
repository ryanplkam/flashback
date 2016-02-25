class Photo < ActiveRecord::Base
  belongs_to :user

  validates :photo, presence: true
  validates :activity, presence: true
end
