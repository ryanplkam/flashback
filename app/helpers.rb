helpers do

  def user_login?
    session.has_key?("user")
  end

  def check_user_login
    redirect '/' unless user_login?
  end

  def check_trip_existense(trip)
    redirect '/' unless trip
  end

  def check_ownership(trip)
    redirect '/' unless trip.user_id == session[:user]
  end

  def generate_random_salut
    SALUTS.values[rand(SALUTS.length)]
  end

end
