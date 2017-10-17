require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'sinatra/flash'

set :database, {adapter: 'sqlite3', database: 'bsharp.sqlite3'}

get '/' do
  erb :home
end




post '/login' do

  user = User.find_by(slack: params[:slack])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    flash[:message] = "Welcome!"
    redirect '/'
  else
    flash[:message] = "Oops, there's a problem "
    redirect back
  end
end
