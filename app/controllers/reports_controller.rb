class ReportsController < ApplicationController

  # GET: /reports
  get "/reports" do
    erb :"/reports/index.html"
  end

  # GET: /report/new
  get "/report/new" do
    @categories = Category.all
    erb :"/reports/new.html"
  end

  # POST: /report
  post "/report" do
    
    Report.new(params)
    redirect "/reports"
  end

  # GET: /reports/5
  get "/reports/:id" do
    erb :"/reports/show.html"
  end

  # GET: /reports/5/edit
  get "/reports/:id/edit" do
    erb :"/reports/edit.html"
  end

  # PATCH: /reports/5
  patch "/reports/:id" do
    redirect "/reports/:id"
  end

  # DELETE: /reports/5/delete
  delete "/reports/:id/delete" do
    redirect "/reports"
  end
end
