get '/users/:user_id/trips/:trip_id/activities/:activity_id/photos/new' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id])
  validate_trip_ownership(params[:trip_id])
  erb :'photos/new'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/photos' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id])
  validate_trip_ownership(params[:trip_id])

  upload_photo = Cloudinary::Uploader.upload(File.open(params[:photo][:tempfile]))

  @activity = Activity.find_by(id: params[:activity_id])
  @photo = Photo.new
  @photo.safe_url = upload_photo["secure_url"]
  @photo.cloudinary_id = upload_photo["public_id"]
  @photo.activity = @activity
  @photo.save
end


get '/users/:user_id/trips/:trip_id/activities/:activity_id/photos/:photo_id/delete' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id], params[:photo_id])
  validate_trip_ownership(params[:trip_id])

  erb :'photos/delete'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/photos/:photo_id/delete' do
  validate_user_login
  validate_url_relationship(params[:user_id], params[:trip_id],params[:activity_id], params[:photo_id])
  validate_trip_ownership(params[:trip_id])

  @photo = Photo.find_by(id: params[:photo_id])
  Cloudinary::Uploader.destroy(@photo.cloudinary_id)
  redirect '/'
end
