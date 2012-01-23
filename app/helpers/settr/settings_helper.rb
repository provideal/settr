class Settr
  module SettingsHelper
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
  end
end