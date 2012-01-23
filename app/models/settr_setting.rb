# encoding: utf-8
class SettrSetting < ActiveRecord::Base

  scope :alterable, where('alterable = ?', true)
  validates_format_of :typ, :with => /^(boolean)|(float)|(integer)|(select)|(string)|(text)+$/

  def val
    case typ
      when 'boolean'
        value == 'true'
      when 'float'
        value.to_f
      when 'integer'
        value.to_i
      else
        value
    end
  end

  def select?
    typ == 'select'
  end

  def options=(opts)
    write_attribute :options, opts.gsub(' ','').gsub(',', ', ')
  end
end