$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vendorize/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vendorize"
  s.version     = Vendorize::VERSION
  s.authors     = ["Bram Swenson"]
  s.email       = ["bram@craniumisajar.com"]
  s.homepage    = "http://githib.com/rasset/rasset"
  s.summary     = "Toolkit for rails asset engines"
  s.description = "Toolkit for rails asset engines"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 3.1"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "aruba"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-cucumber"
  s.add_development_dependency "rb-inotify", "~> 0.8.8"
end
