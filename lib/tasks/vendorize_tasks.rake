namespace :vendorize do

  desc "Updates vendorized assets as defined in vendorize.rb"
  task :update do
    Vendorize.update!
  end

end
