get '/users/:user_id/trips/new' do
  check_user_login
  erb :'trips/new'
end

get '/users/:user_id/trips/:trip_id' do
  erb :'trips/index'
end

post '/users/:user_id/trips' do
  check_user_login

  @trip = Trip.new
  @trip.title = params[:title]
  @trip.start_date = params[:start_date]
  @trip.end_date = params[:end_date]
  @trip.location = params[:location]
  @trip.description = params[:description]
  @trip.user = User.find_by(id: session[:user])

  if @trip.save
    redirect "/users/#{@trip.user_id}/trips"
  else
    erb :'trips/new'
  end
end

get '/users/:user_id/trips/:trip_id/update' do
  check_user_login
  @trip = Trip.find_by(id: params[:trip_id])
  check_user_trip_relationship(@trip)

  erb :'trips/update'
end

post '/users/:user_id/trips/:trip_id' do
  check_user_login
  @trip = Trip.find_by(id: params[:trip_id])
  check_user_trip_relationship(@trip)

  @trip.title = params[:title]
  @trip.start_date = params[:start_date]
  @trip.end_date = params[:end_date]
  @trip.location = params[:location]
  @trip.description = params[:description]

  if @trip.save
    redirect "/users/#{@trip.user_id}/trips"
  else
    erb :'trips/update'
  end
end

get '/users/:user_id/trips/:trip_id/delete' do
  check_user_login
  @trip = Trip.find_by(id: params[:trip_id])
  check_user_trip_relationship(@trip)

  erb :'trips/delete'
end

post '/users/:user_id/trips/:trip_id/delete' do
  check_user_login
  @trip = Trip.find_by(id: params[:trip_id])
  check_user_trip_relationship(@trip)

  @trip.destroy
  redirect "/users/#{@trip.user_id}/trips"
end
