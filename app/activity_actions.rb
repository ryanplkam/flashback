get '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  erb :'activities/index'
end

get '/users/:user_id/trips/:trip_id/activities/new' do
  erb :'activities/new'
end

post '/users/:user_id/trips/:trip_id/activities' do
  "save new trip"
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/update' do
  erb :'activities/update'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  "update trip posted"
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/delete' do
  erb :'activities/delete'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/delete' do
  "delete trip posted"
end
