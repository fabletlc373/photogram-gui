Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "homepage" })
  get("/users", { :controller => "users", :action => "homepage" })
  post("/insert_user", { :controller => "users", :action => "add_user"})
  post("/update_user/:user_id", { :controller => "users", :action => "update_user"})
  get("/users/:username", {:controller => "users", :action => "details"})


  get("/photos", { :controller => "photos", :action => "index" })
  post("/insert_photo", { :controller => "photos", :action => "add_photo" })
  get("/photos/:photo_id", { :controller => "photos", :action => "details" })
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo" })
  post("/update_photo/:photo_id", { :controller => "photos", :action => "update_photo" })

  post("/add_comment", { :controller => "photos", :action => "add_comment" })
  
end
