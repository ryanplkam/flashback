class Photo < ActiveRecord::Base
  belongs_to :activity

  validates :safe_url, presence: true
  validates :activity, presence: true
end
