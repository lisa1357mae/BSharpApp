require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

set :database, {adapter: 'sqlite3', database: 'bsharp.sqlite3'}


#Configure carrierwave
CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

get '/' do
  erb :home
end

get '/profile' do
  erb :profile
end

get '/review' do
  erb :addreview
end

get '/concert' do
  erb :addconcert
end


post '/login' do
  erb :login
end






#
#   user = User.find_by(slack: params[:slack])
#
#   if user && user.password == params[:password]
#     session[:user_id] = user.id
#     flash[:message] = "Welcome!"
#     redirect '/'
#   else
#     flash[:message] = "Oops, there's a problem "
#     redirect back
#   end
# end
