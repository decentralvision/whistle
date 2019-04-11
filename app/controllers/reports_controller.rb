class ReportsController < ApplicationController

  # GET: /reports
  get "/reports" do
    erb :"/reports/index.html"
  end

  # GET: /reports/new
  get "/reports/new" do
    erb :"/reports/new.html"
  end

  # POST: /reports
  post "/reports" do
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
