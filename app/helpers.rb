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

  def check_profile_existence(profile)
    redirect '/' unless profile.id == session[:user]
  end

  def check_profile_ownership(profile)
    redirect '/' unless profile.id == session[:user]
  end

  def check_activity_ownership(activity)
  end

  # def check_friendship(user, friend)
  #   redirect '/' if user.id = friend.id

  #   friendships = Friendship.where(user: user)
  #   friendships.each do |frienship|

  #   redirect "/users/<%=session[:user]%>/friends"
  # end

  def generate_random_salut
    SALUTS.values[rand(SALUTS.length)]
  end

end
