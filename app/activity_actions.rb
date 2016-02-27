get '/users/:user_id/trips/:trip_id/activities/new' do
  check_user_login
  @trip = Trip.find_by(id: params[:trip_id])
  check_user_trip_relationship(@trip)

  erb :'activities/new'
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id' do
  erb :'activities/index'
end

post '/users/:user_id/trips/:trip_id/activities' do
  check_user_login
  @trip = Trip.find_by(id: params[:trip_id])
  check_user_trip_relationship(@trip)

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
