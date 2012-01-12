Settr::Application.routes.draw do
  # settr
  namespace :settr do
    match 'settings' => 'settings#settings' 
  end
end
