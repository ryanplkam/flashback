class Photo < ActiveRecord::Base
  belongs_to :activity

  validates :safe_url, presence: true
  validates :activity, presence: true

  def destroy
    Cloudinary::Uploader.destroy(cloudinary_id)
    super
  end
end
