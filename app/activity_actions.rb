get '/users/:user_id/trips/:trip_id/activities/new' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])

  erb :'activities/new'
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  validate_url_relationship(params[:user_id], params[:trip_id], params[:activity_id])
  @activity = Activity.find_by(id: params[:activity_id])
  erb :'activities/index'
end

post '/users/:user_id/trips/:trip_id/activities' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])

  @activity = Activity.new
  @activity.title = params[:title]
  @activity.start_date = params[:start_date]
  @activity.end_date = params[:end_date]
  @activity.city = params[:city]
  @activity.country = params[:country]
  @activity.venue = params[:venue]
  @activity.description = params[:description]
  @activity.trip = @trip

  if @activity.save
    redirect "/users/#{@activity.trip.user_id}/trips/#{@activity.trip_id}"
  else
    erb :'activities/new'
  end
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/update' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id])
  validate_trip_ownership(params[:trip_id])

  @trip = Trip.find_by(id: params[:trip_id])
  @activity = Activity.find_by(id: params[:activity_id])

  erb :'activities/update'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id])
  validate_trip_ownership(params[:trip_id])

  @activity = Activity.find_by(id: params[:activity_id])
  @activity.title = params[:title]
  @activity.start_date = params[:start_date]
  @activity.end_date = params[:end_date]
  @activity.city = params[:city]
  @activity.country = params[:country]
  @activity.venue = params[:venue]
  @activity.description = params[:description]

  if @activity.save
    redirect "/users/#{@activity.trip.user_id}/trips/#{@activity.trip_id}/activities/#{@activity.id}"
  else
    erb :'activities/update'
  end
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/delete' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id])
  validate_trip_ownership(params[:trip_id])

  @activity = Activity.find_by(id: params[:activity_id])

  erb :'activities/delete'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/delete' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id])
  validate_trip_ownership(params[:trip_id])

  @activity = Activity.find_by(id: params[:activity_id])

  @activity.destroy
  redirect "/users/#{params[:user_id]}/trips/#{params[:trip_id]}"
end
