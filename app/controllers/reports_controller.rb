class ReportsController < ApplicationController

  # GET: /reports
  get "/reports" do
    erb :"/reports/index.html"
  end

  # GET: /report/new
  get "/report/new" do
    erb :"/reports/new.html"
  end

  # POST: /report
  post "/report" do
    report = Report.new(:user_id => session[:user_id], :suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])    
    report.save
    redirect "/reports/#{report.id}"
  end

  # GET: /reports/5
  get "/reports/:id" do
    @report = Report.find(params[:id])
    erb :"/reports/show.html"
  end

  # GET: /reports/5/edit
  get "/reports/:id/edit" do
    @report = Report.find(params[:id])
    erb :"/reports/edit.html"
  end

  # PATCH: /reports/5
  patch "/reports/:id" do
    @report = Report.find(params[:id])
    @report.update(:suspect_desc => params[:suspect_desc].strip, :event_desc => params[:event_desc].strip, :lat => params[:lat], :lng => params[:lng])
    redirect "/reports/:id"
  end

  # DELETE: /reports/5/delete
  get "/reports/:id/delete" do
    @report = Report.find(params[:id])
    @report.delete
    redirect "/homepage"
  end

  def users_report? 
    current_user.id == @report.user_id ? true : false
  end
end
