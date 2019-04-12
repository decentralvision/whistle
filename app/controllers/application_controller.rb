require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "uncrackable_password"
  end

  get "/" do
    erb :"welcome.html"
  end

  get "/landing" do
    erb :"/users/landing.html"
  end

end
