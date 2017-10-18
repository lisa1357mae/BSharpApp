require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require './models'

set :database, {adapter: 'sqlite3', database: 'bsharp.sqlite3'}
enable :sessions

before do
  current_user
end

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

get '/events' do
  @events = Event.all
  erb :events
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :event
end

post '/profile' do
  @current_user.photo = params[:photo]
  @current_user.save!
  redirect back
end

get '/events/:id/review' do
  @event = Event.find(params[:id])
  erb :addreview
end

post '/review' do
  review = Review.new(
    event_id: params[:event_id],
    content: params[:message],
    user_id: @current_user.id
  )
  review.save
  erb :addreview
end
##
get '/review' do
  erb :addreview
end



get '/concert' do
  erb :addconcert
end


post '/login' do
  p "INSIDE LOGIN"
  p params
  user = User.find_by(email: params[:email])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    flash[:message] = "Welcome!"
    redirect '/'
   else
   flash[:message] = "Oops, there's a problem "
    redirect back
  end
end

get '/logout' do
  session[:user_id] = nil
  flash[:message] = "Logged out"
  redirect '/'
end

def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end
