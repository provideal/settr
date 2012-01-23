# encoding: utf-8
module Settr::ControllerFunctions

  module ResourceMode
    def new
      @setting = SettrSetting.new
    end

    def create
      @setting = SettrSetting.new(params[:settr_setting])
      if @setting.select?
        unless @setting.options.include?(@setting.value)
          flash[:error] = t('settr.setting.not_created_value_not_in_options')
          redirect_to settr_settings_path
          return
        end
      end

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
      @new_setting = SettrSetting.new(params[:settr_setting])
      if @new_setting.select?
        unless @new_setting.options.include?(@setting.value)
          flash[:error] = t('settr.setting.not_updated_value_not_in_options')
          redirect_to settr_settings_path
          return
        end
      end

      if @setting.update_attributes(params[:settr_setting])
        flash[:success] = t('settr.setting.updated')
      else
        flash[:error] = t('settr.setting.not_updated')
      end
      redirect_to settr_settings_path
    end

    def index
      @settings = SettrSetting.order(:key)
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
  end

  def settings
    @settings = Settr.alterable

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

  #
  # Helper Methods
  #

  def header(content)
    html_options = Settr.header_class ? {:class => Settr.header_class} : {}
    content_tag(Settr.header_tag.to_sym, content, html_options)
  end

  def link(body, url, html_options = {})
    options = Settr.link_class ? {:class => Settr.link_class} : {}
    options.update(html_options)
    link_to(body, url, options)
  end

  def hash_depth(hash)
    hashes = hash.values.select{|h| h.is_a?(Hash)}
    hashes.present? ? hashes.map{|h| hash_depth(h)}.max + 1 : 1
  end

  #
  # Included Hook
  #
  def self.included(by)
    by.helper_method(:header, :link, :hash_depth)
  end

end
