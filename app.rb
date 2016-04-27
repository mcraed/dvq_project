require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models'
require 'bundler/setup'
require 'rack-flash'

enable :sessions
use Rack::Flash, :sweep => true

set :database, 'sqlite3:ormpractice.sqlite3'
set :sessions, true

get '/' do
	erb :home
end