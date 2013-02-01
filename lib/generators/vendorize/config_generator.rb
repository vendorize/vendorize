module Vendorize
  class ConfigGenerator < Rails::Generators::Base
    def generate_vendorize_config
      create_file 'config/vendorize.rb', <<-EOF

vendorize :jquery do
  version '1.9.0'

  javascript 'jquery.js',     "http://code.jquery.com/jquery-\#{version}.js"
  javascript 'jquery.min.js', "http://code.jquery.com/jquery-\#{version}.min.js"
end
      EOF
    end
  end
end
