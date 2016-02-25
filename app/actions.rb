# Homepage (Root path)
get '/' do
  erb :index
end

get '/user/:user_id/trips' do
  erb :'user/trips'
end