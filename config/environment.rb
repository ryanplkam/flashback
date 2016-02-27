require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

require 'pg'

require 'omniauth-facebook'

require 'cloudinary'

require 'pry'

require_relative './secret'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'lighthouselabssecret'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Facebook login configuration
use OmniAuth::Builder do
  provider :facebook, FB_CLIENT_ID, FB_CLIENT_SECRET,
    :client_options => {
      :site => 'https://graph.facebook.com/v2.2',
      :authorize_url => "https://www.facebook.com/v2.2/dialog/oauth"
      },
    :scope => 'public_profile,email,user_birthday,user_location',
    :image_size => 'large'
end

# Cloudinary API configuration
Cloudinary.config do |config|
  config.cloud_name = 'cuongtn'
  config.api_key = CLOUD_API_KEY
  config.api_secret = CLOUD_API_SECRET
  config.cdn_subdomain = true
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')

enable :sessions
