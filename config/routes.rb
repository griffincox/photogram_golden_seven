Rails.application.routes.draw do

  get("/", { :controller => "photos", :action => "index" })

  # Routes to READ photos
  get("/photos",           { :controller => "photos", :action => "index" })
  get("/photos/:id",       { :controller => "photos", :action => "show" })

  # CREATE

  # UPDATE

  # DESTROY
  get("/delete_photo/:id", { :controller => "photos", :action => "delete_photo" })
end
