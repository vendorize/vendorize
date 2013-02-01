require 'vendorize/engine'
require 'vendorize/manifest'
require 'vendorize/vendorizer'

module Vendorize

  def self.manifest_path
    'config/vendorize.rb'
  end

  def self.manifest
    @manifest = Vendorize::Manifest.new(manifest_path)
  end

  def self.update!
    manifest.each do |asset|
      Vendorize::Vendorizer.new(*asset).vendorize!
    end
  end
end
