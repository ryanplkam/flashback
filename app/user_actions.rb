get '/users/:user_id/profile' do
  validate_url_relationship(params[:user_id])
  @user = User.find_by(id: params[:user_id])
  erb :'users/profile'
end

get '/users/:user_id/trips' do
  validate_url_relationship(params[:user_id])
  @user = User.find_by(id: params[:user_id])
  erb :'users/index'
end

get '/users/:user_id/friends' do
  validate_url_relationship(params[:user_id])
  @friends = Friendship.where(user_id: params[:user_id]).collect { |friendship| friendship.friend }
  erb :'users/friends'
end

get '/users/:user_id/update' do
  validate_user_login
  validate_url_relationship(params[:user_id])
  validate_profile_ownership(params[:user_id])

  @user = User.find_by(id: params[:user_id])

  erb :'users/update'
end

post '/users/:user_id' do
  validate_user_login
  validate_url_relationship(params[:user_id])
  validate_profile_ownership(params[:user_id])

  @profile = User.find_by(params[:id])
  @profile.about_me = params[:about_me]
  @profile.quirky_fact = params[:quirky_fact]

  @profile.save

  redirect "/users/#{session[:user]}/profile"
end

post '/users/:user_id/add' do
  validate_user_login
  validate_url_relationship(params[:user_id])

  @user = User.find_by(id: session[:user])
  @friend = User.find_by(id: params[:user_id])

  validate_friendship(@user, @friend)
  redirect '/' if Friendship.find_by(user: @user, friend: @friend)

  @friendship = Friendship.new
  @friendship.user = @user
  @friendship.friend = @friend
  @friendship.save

  @reversed_friendship = Friendship.new
  @reversed_friendship.user = @friend
  @reversed_friendship.friend = @user
  @reversed_friendship.save

  redirect "/users/#{params[:user_id]}/profile"
end

post '/users/:user_id/delete' do
  validate_user_login
  validate_url_relationship(params[:user_id])

  @user = User.find_by(id: session[:user])
  @friend = User.find_by(id: params[:user_id])

  validate_friendship(@user, @friend)

  @friendship = Friendship.find_by(user: @user, friend: @friend)
  @reversed_friendship = Friendship.find_by(user: @friend, friend: @user)

  redirect '/' unless @friendship

  @friendship.destroy
  @reversed_friendship.destroy

  redirect "/users/#{params[:user_id]}/profile"
end

get '/auth/:provider/callback' do
  redirect '/' if user_login?
  redirect '/' unless request.env['omniauth.auth']

  auth = request.env['omniauth.auth']

  fbuser = User.new
  fbuser.facebook_id = auth.uid
  fbuser.email = auth.info.email
  fbuser.name = auth.info.name
  fbuser.photo = auth.info.image
  fbuser.location = auth.info.location

  fbuser = User.find_by email: fbuser.email unless fbuser.save

  session[:user] = fbuser.id

  redirect "/users/#{session[:user]}/trips"
end

get '/logout' do
  validate_user_login

  session.delete(:user)
  redirect '/'
end
