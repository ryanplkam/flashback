class Activity < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  belongs_to :trip

  validates :title, presence: true
  validates :start_date, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :trip, presence: true

  validate :start_date_must_before_end_date, if: :end_date

  def start_date_must_before_end_date
    errors.add(:start_date, 'must be before end dates') if start_date - end_date > 0
  end
end
