# encoding: utf-8
class Settr::SettingsController < Settr::ApplicationController
  
  def edit
    @settings = Settr.all
    
    if request.post?
      params[:settr].each do |k, v|
        setting = SettrSetting.find_by_key(k)
        setting.value = (setting.typ == 'boolean' ? (v == '1').to_s : v)
        setting.save!
      end      
      flash[:success] = 'Einstellungen gesichert'
      redirect_to settr_settings_path
    end
  end
end