class ActionController::Base
  def self.settr(resource = false)
    self.send :include, Settr::ControllerFunctions
    self.send :include, Settr::ControllerFunctions::ResourceMode if resource
  end
end
