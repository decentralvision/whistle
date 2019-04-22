class ReportsController < ApplicationController

  # GET: /reports
  get "/reports" do
    if logged_in?
      @reports = current_user.reports
      erb :"/reports/index.html"
    else
      redirect "/reports/all"
    end
  end

  get "/reports/all" do
    @reports = Report.all
    erb :"/reports/index.html"
  end

  get "/reports/map" do
    @reports = Report.all
    erb :"/reports/map.html"
  end

  # GET: /report/new
  get "/report/new" do
    @report = Report.new
    redirect_if_not_logged_in
    erb :"/reports/new.html"
  end

  # POST: /report
  post "/report" do
    redirect_if_not_logged_in
    @report = Report.new(:user_id => session[:user_id], :suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])  
    if params[:lat].empty?
      @errors= "Please use the map below to select a location."
      erb :"/reports/new.html"
    elsif params[:suspect_desc].length < 60
      @errors= "Please enter a description of the suspect(s) longer than 60 characters"
      erb :"/reports/new.html"
    elsif params[:event_desc].length < 60
      @errors= "Please enter a description of the event(s) longer than 60 characters"
      erb :"/reports/new.html"
    else
      # report = Report.new(:user_id => session[:user_id], :suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])    
      @report.save
      redirect ("/reports/#{@report.id}")
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
    if users_report? 
      erb :"/reports/edit.html"
    else 
      redirect "/reports/#{params[:id]}"
    end
  end

  # PATCH: /reports/5
  patch "/reports/:id/edit" do
    @report = Report.find(params[:id])
    if users_report? 
      @report.update(:suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])
      redirect "/reports/#{params[:id]}"
    else 
      redirect "/reports/#{params[:id]}"
    end
  end

  # DELETE: /reports/5/delete
  delete "/reports/:id/delete" do
    @report = Report.find(params[:id])
    if users_report?
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
