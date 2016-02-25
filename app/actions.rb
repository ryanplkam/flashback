# Homepage (Root path)
get '/' do
  erb :index
end

get '/user/:user_id/trips' do
  erb :'users/user_id/trips/index'
end

get '/user/:user_id/trips/:trip_id' do
  erb :'users/user_id/trips/trip_id/index'
end