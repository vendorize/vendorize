module Vendorize
  class ConfigGenerator < Rails::Generators::Base
    def generate_vendorize_config
      create_file 'config/vendorize.rb', <<-EOF
      EOF
    end
  end
end
