get '/users/:user_id/trips/:trip_id/activities/new' do
  check_user_login
  erb :'activities/new'
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  erb :'activities/index'
end

post '/users/:user_id/trips/:trip_id/activities' do
  check_user_login
  "save new activity"
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/update' do
  check_user_login
  erb :'activities/update'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  check_user_login
  "update trip posted"
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/delete' do
  check_user_login
  erb :'activities/delete'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/delete' do
  check_user_login
  "delete trip posted"
end
