Rails.application.routes.draw do
  # settr
  if Settr.resources
    namespace :settr do
      resources 'settings' do
        match 'settings', :on => :collection
      end
    end  
  else
    match 'settr/settings/settings' => 'settr/settings#settings'
  end
end