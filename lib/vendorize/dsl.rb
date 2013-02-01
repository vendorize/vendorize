module Vendorize
  class DSL
    attr_reader :manifest

    def initialize(code)
      @manifest = {}
      instance_eval(code)
    end

    def vendorize(name, &block)
      @current_name = name.to_sym
      @manifest[@current_name] = {}
      block.call
    end

    def version(version=nil)
      return @manifest[@current_name][:version] unless version.present?
      @manifest[@current_name][:version] = version
    end

    def javascript(filename, uri)
      @manifest[@current_name][:javascripts] ||= {}
      @manifest[@current_name][:javascripts][filename] = uri
    end
  end
end
