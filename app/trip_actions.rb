get '/users/:user_id/trips/new' do
  validate_user_login
  erb :'trips/new'
end

get '/users/:user_id/trips/:trip_id' do
  validate_url_relationship(params[:user_id], params[:trip_id])
  @trip = Trip.find_by(id: params[:trip_id])
  erb :'trips/index'
end

post '/users/:user_id/trips' do
  validate_user_login

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
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])

  erb :'trips/update'
end

post '/users/:user_id/trips/:trip_id' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])

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
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])

  erb :'trips/delete'
end

post '/users/:user_id/trips/:trip_id/delete' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])

  @trip.destroy
  redirect "/users/#{@trip.user_id}/trips"
end

get '/users/:user_id/trips/:trip_id/photos' do
  validate_url_relationship(params[:user_id], params[:trip_id])
  @trip = Trip.find_by(id: params[:trip_id])
  erb :'trips/album'
end
