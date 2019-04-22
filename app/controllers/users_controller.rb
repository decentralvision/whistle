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
      if User.find_by username: params[:username]
        flash[:message] = "Username already taken"
        erb :"/users/signup.html"
      elsif params[:password].length < 8
        flash[:message] = "Password must be greater than 8 characters long"
        erb :"/users/signup.html"
      else
        user = User.new(:username => params[:username], :password => params[:password])
        if user.save
          session[:user_id] = user.id
          redirect "/homepage"
        end
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
    if !user || !user.authenticate(params[:password])
      flash[:message] = "Invalid username or password."
      erb :'/users/login.html'
    else
      session[:user_id] = user.id
      redirect "/homepage"
    end
  end

  get "/logout" do
    if logged_in?
      session[:user_id] = nil
      redirect "/"
    else
      redirect "/"
    end
  end

  delete "/users/:id/delete" do
    redirect "/users"
  end
  
  get "/homepage" do
    redirect_if_not_logged_in
    erb :"/users/homepage.html"
  end
  
end
