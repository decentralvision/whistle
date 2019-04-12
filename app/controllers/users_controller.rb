class UsersController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect "/homepage"
    else
      erb :"/users/signup.html"
    end
  end
  
  post "/signup" do
    if params.none? {|param, value| value.empty?}
      user = User.new(:username => params[:username], :password => params[:password])
      if user.save
        session[:user_id] = user.id
        redirect "/homepage"
      end
    else
      redirect "/signup"
    end
  end

  get "/login" do
    if logged_in?
      redirect "/homepage"
    else
      erb :'/users/login.html'
    end
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/homepage"
    else
      redirect "/login"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end

  delete "/users/:id/delete" do
    redirect "/users"
  end
  
  get "/homepage" do
    if logged_in? 
      erb :"/users/homepage.html"
    else
      redirect "/login"
    end
  end
  
end
