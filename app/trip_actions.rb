get '/users/:user_id/trips/:trip_id' do
  erb :'trips/index'
end

get '/users/:user_id/trips/:new' do
  erb :'trips/new'
end

post '/users/:user_id/trips' do
  "new trip posted"
end

get '/users/:user_id/trips/:trip_id/update' do
  erb :'trips/update'
end

post '/users/:user_id/trips/:trip_id' do
  "update trip posted"
end

get '/users/:user_id/trips/:trip_id/delete' do
  erb :'trips/delete'
end

post '/users/:user_id/trips/:trip_id/delete' do
  "delete trip posted"
end
