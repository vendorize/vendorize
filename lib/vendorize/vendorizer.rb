require 'open-uri'

module Vendorize
  class Vendorizer
    def initialize(name, metadata)
      @name = name
      @metadata = metadata
    end

    def vendorize!
      @metadata.each do |asset_type, assets|
        next if asset_type == :version
        assets.each do |filename, uri|
          FileUtils.mkdir_p(vendored_asset_path(asset_type))
          File.open(vendored_asset_path(asset_type, filename), 'w') do |f|
            f.write(open(uri).read)
          end
        end
      end
    end

    def vendored_asset_path(*paths)
      File.join('vendor', 'assets', *(paths.map(&:to_s)))
    end
  end
end
