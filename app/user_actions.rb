get '/users/:user_id/profile' do
  @user = User.find_by(id: params[:user_id])
  erb :'users/profile'
end

get '/users/:user_id/trips' do
  erb :'users/index'
end

get '/users/:user_id/friends' do
  erb :'users/friends'
end

get '/users/:user_id/update' do
  check_user_login
  @profile = User.find_by(params[:id])
  check_profile_existence(@profile)
  check_profile_ownership(@profile)

  erb :'users/update'
end

post '/users/:user_id' do
  check_user_login
  @profile = User.find_by(params[:id])
  check_profile_existence(@profile)
  check_profile_ownership(@profile)

  @profile.about_me = params[:about_me]
  @profile.quirky_fact = params[:quirky_fact]

  @profile.save

  redirect "/users/#{session[:user]}/profile"
end

get '/auth/:provider/callback' do

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

  redirect '/'
end

get '/logout' do
  check_user_login

  session.delete(:user)
  redirect '/'
end
