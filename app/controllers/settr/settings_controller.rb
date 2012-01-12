# encoding: utf-8
class Settr::SettingsController < Settr::ApplicationController
  
  def edit
    @settings = Settr.all
    
    if request.post?
      params[:settr].each do |k, v|
        setting = SettrSetting.find_by_key(k)
        case setting.typ
          when 'boolean'
            setting.value = (v == '1').to_s
          else
            setting.value = v       
        end
        setting.save!
      end
      
      flash[:success] = 'Einstellungen gesichert'
    end
  end
end
