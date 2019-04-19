class ReportsController < ApplicationController

  # GET: /reports
  get "/reports" do
    if logged_in?
      @reports = Report.where(user_id: session[:user_id])
      erb :"/reports/index.html"
    else
      @reports = Report.all
      erb :"/reports/index.html"
    end
  end

  get "/reports/map" do
    @reports = Report.all
    erb :"/reports/map.html"
  end

  # GET: /report/new
  get "/report/new" do
    if logged_in?
      erb :"/reports/new.html"
    else
      redirect "/login"
    end
  end

  # POST: /report
  post "/report" do
    if params[:lat].empty?
      flash[:message] = "Please use the map below to select a location."
      redirect "/report/new"
    elsif params[:suspect_desc].length < 60
      flash[:message] = "Please enter a description of the suspect(s) longer than 60 characters"
      redirect "/report/new"
    elsif params[:event_desc].length < 60
      flash[:message] = "Please enter a description of the event(s) longer than 60 characters"
      redirect "/report/new"
    else
      report = Report.new(:user_id => session[:user_id], :suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])    
      report.save
      redirect ("/reports/#{report.id}")
    end
  end

  # GET: /reports/5
  get "/reports/:id" do
    @report = Report.find(params[:id])
    erb :"/reports/show.html"
  end

  # GET: /reports/5/edit
  get "/reports/:id/edit" do
    @report = Report.find(params[:id])
    if users_report? && logged_in?
      erb :"/reports/edit.html"
    else 
      redirect "/reports/#{params[:id]}"
    end
  end

  # PATCH: /reports/5
  patch "/reports/:id/edit" do
    @report = Report.find(params[:id])
    if users_report? && logged_in?
      @report.update(:suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])
      redirect "/reports/#{params[:id]}"
    else 
      redirect "/reports/#{params[:id]}"
    end
  end

  # DELETE: /reports/5/delete
  delete "/reports/:id/delete" do
    @report = Report.find(params[:id])
    if users_report? && logged_in?
      @report.delete
      redirect "/homepage"
    else
      redirect "/homepage"
    end
  end

  def users_report? 
    if logged_in?
      current_user.id == @report.user_id ? true : false
    else 
      false
    end
  end
end
