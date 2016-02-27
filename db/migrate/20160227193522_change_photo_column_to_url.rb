class ChangePhotoColumnToUrl < ActiveRecord::Migration
  def change
    rename_column :photos, :photo, :safe_url
    add_column :photos, :cloudinary_id, :string
  end
end
