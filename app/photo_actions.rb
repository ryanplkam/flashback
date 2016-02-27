get '/users/:user_id/trips/:trip_id/photos' do
end

get '/users/:user_id/trips/:trip_id/activities/:activity_id/photos/new' do
  check_user_login
  erb :'photos/new'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/photos' do

  check_user_login
  @activity = Activity.find_by(id: params[:activity_id])
  upload_photo = Cloudinary::Uploader.upload(File.open(params[:photo][:tempfile]))

  @photo = Photo.new
  @photo.safe_url = upload_photo["secure_url"]
  @photo.cloudinary_id = upload_photo["public_id"]
  @photo.activity = @activity
  @photo.save
end


get '/users/:user_id/trips/:trip_id/activities/:activity_id/photos/:photo_id/delete' do
  check_user_login
  erb :'photos/delete'
end

post '/users/:user_id/trips/:trip_id/activities/:activity_id/photos/:photo_id/delete' do
  check_user_login

  @photo = Photo.find_by(id: params[:photo_id])
  Cloudinary::Uploader.destroy(@photo.cloudinary_id)
  redirect '/'
end
