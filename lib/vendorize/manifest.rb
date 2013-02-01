require 'vendorize/dsl'

module Vendorize
  class Manifest
    include Enumerable

    def initialize(manifest_path)
      @manifest = load_manifest_from_disk(manifest_path)
    end

    def each(&block)
      @manifest.each(&block)
    end

    private

    def load_manifest_from_disk(manifest_path)
      Vendorize::DSL.new(File.read(File.expand_path(manifest_path))).manifest
    end

  end
end
