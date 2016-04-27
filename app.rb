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

post '/sign-in' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You've been signed in successfully."
  else
    flash[:alert] = "There was a problem signing you in."
  end
  redirect "/"
end

post '/sign-up' do
 
end