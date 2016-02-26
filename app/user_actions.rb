get '/users/:user_id/profile' do
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
  erb :'users/update'
end

post '/users/:user_id' do
  check_user_login
  "post"
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
