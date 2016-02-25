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
  erb :'users/update'
end

post '/users/:user_id' do
  "post"
end
