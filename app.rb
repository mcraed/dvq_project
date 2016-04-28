require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models'
require 'bundler/setup'
require 'rack-flash'

enable :sessions
use Rack::Flash, :sweep => true
configure(:development){ set :database, 'sqlite3:ormpractice.sqlite3' }
set :sessions, true

get '/' do
	erb :home
end

get '/create_post' do
	erb :create_post
end

post '/create_post' do
	if params[:newpost] != " "
		Post.create(user_id:  body: params[:newpost])
	else
		redirect '/create_post'
	end
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

post '/signup' do
  #check for basic empty fields
  if params[:fname] != "" && params[:lname] != "" && params[:email] != "" && params[:username] != "" && params[:password] != "" 
    #create the new user and insert into database
    User.create(fname: params[:fname], lname: params[:lname], email: params[:email], username: params[:username], password: params[:password])
  else
    #eventually display error message here if fields are blank
    redirect '/signup'
  end
  #this block grabs their newly created user ID, sets it as the session, and then reroutes them to the complete profile page
	@user = User.where(username: params[:username]).first
  # session[:user_id] = @user.id
end