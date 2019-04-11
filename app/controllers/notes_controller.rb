class NotesController < ApplicationController

  # GET: /reports/1/notes
  get "/reports/:report_id/notes" do
    erb :"/notes/index.html"
  end

  # GET: /reports/1/notes/new
  get "/reports/:report_id/notes/new" do
    erb :"/notes/new.html"
  end

  # POST: /reports/1/notes
  post "/reports/:report_id/notes" do
    redirect "/notes"
  end

  # GET: /reports/1/notes/5
  get "/reports/:report_id/notes/:id" do
    erb :"/notes/show.html"
  end

  # GET: /reports/1/notes/5/edit
  get "/reports/:report_id/notes/:id/edit" do
    erb :"/notes/edit.html"
  end

  # PATCH: /reports/1/notes/5
  patch "/reports/:report_id/notes/:id" do
    redirect "/notes/:id"
  end

  # DELETE: /reports/1/notes/5/delete
  delete "/reports/:report_id/notes/:id/delete" do
    redirect "/notes"
  end
end
