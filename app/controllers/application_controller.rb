require './config/environment'
require 'pry'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "wsheicsrtelte"
  end

  get "/" do
    if session[:disclaimer] == false
      redirect "/landing"
    else
      session[:disclaimer] = false
      erb :"welcome.html"
    end
  end

  get "/landing" do
    erb :"/users/landing.html"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
  
end
