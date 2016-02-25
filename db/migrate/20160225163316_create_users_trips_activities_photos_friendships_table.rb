class CreateUsersTripsActivitiesPhotosFriendshipsTable < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string      :name
      t.date        :birthday
      t.string      :email
      t.string      :photo
      t.string      :location
      t.text        :about_me
      t.text        :quirky_fact
      t.string      :facebook_id
      t.string      :google_id
      t.timestamps
    end

    create_table :friendships do |t|
      t.timestamps
      t.belongs_to :user, index: true
      t.belongs_to :friend, index: true
    end

    create_table :trips do |t|
      t.string      :title
      t.date        :start_date
      t.date        :end_date
      t.string      :location
      t.text        :description
      t.belongs_to  :user, index: true
      t.timestamps
    end

    create_table :activities do |t|
      t.string      :title
      t.date        :start_date
      t.date        :end_date
      t.string      :country
      t.string      :city
      t.string      :venue
      t.text        :description
      t.belongs_to  :trip, index: true
      t.timestamps
    end

    create_table :photos do |t|
      t.string        :photo
      t.text        :caption
      t.belongs_to  :activity, index: true
      t.timestamps
    end
  end
end
