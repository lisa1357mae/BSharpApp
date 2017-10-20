require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require './models'
require 'dotenv/load'
require 'sendgrid-ruby'

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


get '/newuser' do
  erb :newuser
end

post '/newuser' do
  names = params[:name].split(' ')
  user = User.new(
    first: names[0],
    last: names[1],
    email: params[:email],
    password: params[:password]
  )
  user.save
  session[:user_id] = user.id
  redirect '/profile'
end

get '/profile' do
  @reviews = Review.where(user_id: @current_user).where.not(event_id: nil)
  @users = User.all
  erb :profile, locals: {user: @current_user, me: true}
end

get '/profile/:id' do
  @reviews = Review.where(user_id: params[:id]).where.not(event_id: nil)
  @users = User.all
  user = User.find_by(id: params[:id])
  erb :profile, locals: {user: user, me: false}
end

get '/events' do
  @events = Event.all
  erb :events
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :event
  redirect '/events1'

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
  redirect '/profile'
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
  flash[:message] = "Logged Out"
  redirect '/'
end

post '/submitform' do
  erb :profile
end

def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end

post '/users/me/delete' do
  session[:user_id] = nil
  @current_user.destroy
  redirect '/'
end
