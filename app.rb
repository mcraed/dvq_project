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

def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  end
end

get '/' do
	erb :home
end

get '/feed' do
	erb :feed
end

get '/create_post' do
  @post = 

	erb :create_post
end

get '/account_details' do
  @user = User.find(session[:user_id])
  erb :account_details
end

post '/create_post' do
  # @user = User.find(session[:user_id])
  puts @user.inspect

	if params[:newpost] != " "
		@post = Post.new(user_id: session[:user_id], body: params[:newpost])

    redirect '/feed'
	else
		redirect '/create_post'
	end
end

post '/signin' do

  @user = User.where(username: params[:username]).first

  if @user.password == params[:password]
    session[:user_id] = @user.id
    flash[:notice] = "You've been signed in successfully."
  
  	redirect "/feed"
  else
    flash[:alert] = "There was a problem signing you in."

    redirect "/"
  end
end

post '/signup' do
  #check for basic empty fields
  if params[:fname] != "" && params[:lname] != "" && params[:email] != "" && params[:username] != "" && params[:password] != "" 
    #create the new user and insert into database
    @user = User.new(fname: params[:fname], lname: params[:lname], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = @user.id

    redirect '/create_post'
  else
    #eventually display error message here if fields are blank
    redirect '/signup'
  end
  #this block grabs their newly created user ID, sets it as the session, and then reroutes them to the complete profile page
	@user = User.where(username: params[:username]).first
  # session[:user_id] = @user.id
end

post '/account_details' do
  @user = current_user
  if params[:fname] != "" || params[:lname] != "" || params[:username] != ""
    @user.update(fname: params[:fname], lname: params[:lname], username: params[:username])

    flash[:notice] = "Your information was successfully updated!"
  else
    flash[:alert] = "There was a problem updating your information."
  end
end