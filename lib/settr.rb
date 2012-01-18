require 'rails'
require 'simple_form'

class Settr

  # resources
  cattr_accessor :resources
  @@resources

  # header 
  cattr_accessor :header_tag, :header_class
  @@header_tag
  @@header_class

  # table
  cattr_accessor :table_class
  @@table_class
  
  # form
  cattr_accessor :form_class
  @@form_class
  
  # links
  cattr_accessor :link_class
  @@link_class
  
  # default way to setup settr
  def self.setup
    yield self
  end
  
  def self.method_missing(*args)
    Settr.new.send(*args)
  end

  def method_missing(sym, *args, &block)
    s = sym.to_s.end_with?("?") ? sym.to_s[0..-2] : nil
    @str = @str ? "#{@str}.#{s || sym}" : (s || sym.to_s)
    s ? get_val.present? : self
  end

  def get_val()
    setting = SettrSetting.where(key: @str).first
    return unless setting
    setting.val
  end

  def to_s() 
    get_val.to_s
  end
  alias_method :to_str, :to_s

  def to_i()
    get_val.to_i
  end
  alias_method :to_int, :to_i

  def to_f()
    get_val.to_f
  end

  alias_method :inspect, :to_s

  %w{+ - / * << >> []}.each do |op|
    define_method op do |args|
      get_val.send(op, args)
    end
  end

  [:all, :alterable].each do |method|
    self.define_singleton_method(method) do
      SettrSetting.send(method).inject({}) do |h, s|
        kk = s.key.split(".")
        hh = h
        kk.each_with_index do |k, i|
          hh[k] ||= (i == kk.count-1 ? s : {})
          hh = hh[k]
        end
        h
      end
    end
  end
end

require 'settr/version'
require 'settr/engine'