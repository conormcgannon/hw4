Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  
  get  "/login"   => "sessions#new"
  post "/sessions" => "sessions#create"
  get  "/logout"  => "sessions#destroy"
  
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
