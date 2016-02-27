helpers do

  def user_login?
    session.has_key?("user")
  end

  def check_user_login
    redirect '/' unless user_login?
  end

  def check_existence(thing)
    redirect '/' unless thing
  end

  def check_user_trip_relationship(trip)
    check_existence(trip)
    redirect '/' unless trip.user_id == session[:user]
  end

  def check_trip_activity_relationship(trip, activity)
    check_existence(trip)
    check_existence(activity)
    redirect '/' unless activity.trip == trip
  end

  def check_profile_ownership(profile)
    check_existence(profile)
    redirect '/' unless profile.id == session[:user]
  end

  def check_friendship(user, friend)
    check_existence(user)
    check_existence(friend)
    redirect '/' if user.id == friend.id
  end

  def generate_random_salut
    SALUTS.values[rand(SALUTS.length)]
  end

end
