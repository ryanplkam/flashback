helpers do

  def user_login?
    session.has_key?("user")
  end

  def check_user_login
    redirect '/' unless user_login?
  end
end
