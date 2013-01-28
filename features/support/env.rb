require 'aruba/cucumber'
Before do
  # do this so we can create rails projects in test
  @base_dirs = ["/tmp", "vendorize_arbua"]
  # ensure the base dir is clean
  FileUtils.rm_rf(File.join(*@base_dirs))
  @dirs = @base_dirs.clone
end
