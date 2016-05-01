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

#Trying to print out the news feed
  
get '/feed' do
  @user = current_user
  @recent = Post.last(10)
  @post = @recent.reverse 

  
  if @user
    erb :feed
  else
    flash[:alert] = "Please sign in."
    erb :home
  end
end

get '/delete_acct' do
  @user = current_user  
  @user.delete
  session.clear
  flash[:alert] = "Account Deleted. We didn't want you here anyway."
  redirect '/'
end

# get '/create_post' do
#   @user = current_user
#   if @user
#    erb :create_post
#   else
#     flash[:alert] = "Please sign in."
#     erb :home
#   end
# end

post '/create_post' do
  @user = current_user
 
  if @user
    t = Time.now
    @post = Post.new(user_id: @user.id, username: @user.username, created: t.strftime("%m/%d/%y %l:%M%p"), body: params[:body])
  else 
    redirect '/'
    flash[:alert] = "Please sign in."
  end

  if @post.body.length < 151 && params[:body] != " "
    @post.save
    redirect '/feed'
  else 
    flash[:alert] = "Failed; post is empty or more than 150 chracters."
  end
end

post '/sign_in' do
  @user = User.where(username: params[:username]).first

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
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
    @user = User.create(fname: params[:fname], lname: params[:lname], email: params[:email], username: params[:username], password: params[:password])
  
    session[:user_id] = @user.id

    redirect '/create_post'
  else
    #eventually display error message here if fields are blank
    redirect '/'
  end
  #this block grabs their newly created user ID, sets it as the session, and then reroutes them to the complete profile page
  @user = User.where(username: params[:username]).first
  # session[:user_id] = @user.id
end

get '/#' do
  @user = current_user

  if @user

  else
    flash[:alert] = "Please sign in."
    erb :home
  end
end 

post '/account_details' do
  @user = current_user

  if params[:fname] != "" || params[:lname] != "" || params[:username] != ""
    @user.update(fname: params[:fname], lname: params[:lname], username: params[:username])

    flash[:notice] = "Your information was successfully updated!"
    redirect '/feed'
  else
    flash[:alert] = "There was a problem updating your information."
  end
end

get '/signout' do
  @user = current_user
  if @user
    session.clear
    flash[:notice] = "You have been signed out."
  else
    flash[:alert] = "You are not signed in."
  end
  redirect '/'
end
