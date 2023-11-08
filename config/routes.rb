Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "homepage" })
  get("/users", { :controller => "users", :action => "homepage" })
  post("/insert_user", { :controller => "users", :action => "add_user"})
  post("/update_user/:user_id", { :controller => "users", :action => "update_user"})
  get("/users/:user_id", {:controller => "users", :action => "details"})


  get("/photos", { :controller => "photos", :action => "index" })
  get("/insert_photo", { :controller => "photos", :action => "add_photo" })
  get("/photos/:photo_id", { :controller => "photos", :action => "details" })
  


end
