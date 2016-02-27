require_relative './user_actions.rb'
require_relative './trip_actions.rb'
require_relative './activity_actions.rb'
require_relative './photo_actions.rb'
require_relative './data/saluts.rb'
require_relative './helpers.rb'

get '/' do
  erb :index
end

get '/search' do
  erb :search
end

get '/about' do
  erb :about
end
