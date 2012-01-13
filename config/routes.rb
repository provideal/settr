Rails.application.routes.draw do
  # settr
  namespace :settr do
    match 'settings' => 'settings#edit' 
  end  
end