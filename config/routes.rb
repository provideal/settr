Rails.application.routes.draw do
  # settr
  namespace :settr do
    resources 'settings' do
      match 'settings', :on => :collection
    end
  end  
end