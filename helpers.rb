module Helpers
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end
  
  module ClassMethods
    helpers do
      
      def link_to_unless_current(label, options={}) 
        return label if request.env['REQUEST_URI'] == options[:url]
        link_to(label, options)
      end

      def link_to(label, options = {})
        url = options.delete(:url) || '/'
        
        html_options = begin
          if options.has_key?(:html)
            (options.delete(:html).map do |k,v|
              "#{k}=\"#{CGI.escapeHTML(v)}\""
            end).join(' ')
          else
            ''
          end
        end
        
        if options.any?
          url << '?' + options.to_param
        end

        "<a href=\"#{URI.escape(url)}\" #{html_options}>#{label}</a>"
      end

      def javascript_include_tag(*names)
        (names.flatten.map do |name|
          "<script src='/javascripts/#{name.to_s}.js?#{Time.now.to_i}' type='text/javascript'></script>"
        end) * "\n"
      end

      def stylesheet_link_tag(*names)
        (names.flatten.map do |name|
          "<link href='/styles/#{name.to_s}.css' media='all' rel='stylesheet' type='text/css' />"
        end) * "\n"
      end
      
    end
  end
end