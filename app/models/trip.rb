class Trip < ActiveRecord::Base
  has_many :activities
  belongs_to :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :user, presence: true

  validate :start_date_must_before_end_date, if: :end_date

  def start_date_must_before_end_date
    errors.add(:start_date, 'must be before end date') if start_date - end_date > 0
  end
end
