require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

set :database, {adapter: 'sqlite3', database: 'bsharp.sqlite3'}

get '/' do
  erb :home
end
