# encoding: utf-8

class Settr::Creator

  def initialize
    @strs = []
  end

  def self.method_missing(sym, *args)
    self.new().send(sym, *args)
  end

  def method_missing(sym, *args)
    @strs << sym
    _create_default_setting(*args) if args.present?
    self
  end

  private

  def _create_default_setting(value, opts={})
    key = @strs.map(&:to_s).join('.')
    return if SettrSetting.where(key: key).present?
    typ = opts[:typ] || case value
    when String then 'string'
    when Fixnum then 'integer'
    when Float, BigDecimal then 'float'
    else
      if opts[:options] then 'select'
      else raise "Don't know the type of setting '#{key}', give me a hint with :typ parameter"
      end
    end
    SettrSetting.create!({
      :key        => key,
      :value      => value,
      :typ        => typ,
      :alterable  => opts.has_key?(:alterable) ? opts[:alterable] : true
    })
  end

end