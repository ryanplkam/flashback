helpers do

  def user_login?
    session.has_key?("user")
  end

  def validate_user_login
    redirect '/' unless user_login?
  end

  def validate_existence(thing)
    redirect '/' unless thing
  end

  def validate_trip_ownership(trip_id)
    trip = Trip.find_by(id: trip_id)
    validate_existence(trip)
    redirect '/' unless trip.user_id == session[:user]
  end

  def validate_profile_ownership(profile_id)
    profile = User.find_by(id: profile_id)
    redirect '/' unless profile.id == session[:user]
  end

  def validate_friendship(user, friend)
    validate_existence(user)
    validate_existence(friend)
    redirect '/' if user.id == friend.id
  end

  def validate_url_relationship(user_id, trip_id=nil, activity_id=nil, photo_id=nil)

    user = User.find_by(id: user_id)
    validate_existence(user)

    if trip_id
      trip = Trip.find_by(id: trip_id)
      validate_existence(trip)
      redirect '/' unless trip.user == user
    end

    if activity_id
      activity = Activity.find_by(id: activity_id)
      validate_existence(activity)
      redirect '/' unless activity.trip == trip
    end

    if activity_id && photo_id
      photo = Photo.find_by(id: photo_id)
      validate_existence(photo)
      redirect '/' unless photo.activity == activity
    end
  end

  def generate_random_salut
    SALUTS.values[rand(SALUTS.length)]
  end

  def generate_random_photo(trip)
    activity = trip.activities.sample
    return "http://i.imgur.com/rat4xOV.jpg" unless activity
    photo = activity.photos.sample
    return "http://i.imgur.com/rat4xOV.jpg" unless photo
    photo.safe_url
  end

end
