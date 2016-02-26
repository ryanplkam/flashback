get '/users/:user_id/trips/new' do
  check_user_login
  erb :'trips/new'
end

get '/users/:user_id/trips/:trip_id' do
  erb :'trips/index'
end

post '/users/:user_id/trips' do
  check_user_login
  "new trip posted"
end

get '/users/:user_id/trips/:trip_id/update' do
  check_user_login
  erb :'trips/update'
end

post '/users/:user_id/trips/:trip_id' do
  check_user_login
  "update trip posted"
end

get '/users/:user_id/trips/:trip_id/delete' do
  check_user_login
  erb :'trips/delete'
end

post '/users/:user_id/trips/:trip_id/delete' do
  check_user_login
  "delete trip posted"
end
