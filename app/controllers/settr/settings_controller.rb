# encoding: utf-8
class Settr::SettingsController < Settr::ApplicationController

  def new
    @setting = SettrSetting.new
  end
  
  def create
    @setting = SettrSetting.new(params[:settr_setting])
    if @setting.save
      flash[:success] = t('settr.setting.created')
    else
      flash[:error] = t('settr.setting.not_created')
    end
    redirect_to settr_settings_path
  end

  def edit
    @setting = SettrSetting.find(params[:id])
  end

  def update
    @setting = SettrSetting.find(params[:id])
    if @setting.update_attributes(params[:settr_setting])
      flash[:success] = t('settr.setting.updated')
    else
      flash[:error] = t('settr.setting.not_updated')
    end
    redirect_to settr_settings_path
  end
  
  def index
    @settings = SettrSetting.all
  end
  
  def destroy
    @setting = SettrSetting.find(params[:id])
    if @setting.destroy
      flash[:success] = t('settr.setting.deleted')
    else
      flash[:error] = t('settr.setting.not_deleted')
    end
    redirect_to settr_settings_path
  end
  
  def settings
    @settings = Settr.all
    
    if request.post?
      params[:settr].each do |k, v|
        setting = SettrSetting.find_by_key(k)
        setting.value = (setting.typ == 'boolean' ? (v == '1').to_s : v)
        setting.save!
      end      
      flash[:success] = t('settr.settings.saved')
      redirect_to settings_settr_settings_path
    end
  end
end