require 'spec_helper'

def test_dir(*paths)
  File.join('/tmp/vendorize_spec', *paths)
end

def recreate_test_directories
  remove_test_directories
  FileUtils.mkdir_p(test_dir('config'))
  FileUtils.mkdir_p(test_dir('vendor', 'assets', 'javascripts'))
end

def remove_test_directories
  FileUtils.rmtree(test_dir)
end

def file_should_exist(*paths)
  File.exist?(test_dir(*paths)).should be_true
end

def write_config
  File.open(test_dir('config/vendorize.rb'), 'w') do |f|
    f.write <<-EOF
vendorize :jquery do
  version '1.9.0'
  javascript 'jquery.js', "http://code.jquery.com/jquery-\#{version}.js"
end
EOF
  end
end

def in_testdir(&block)
  Dir.chdir(test_dir, &block)
end

describe 'Vendorize' do

  before(:each) do
    recreate_test_directories
  end
  after(:each) do
    remove_test_directories
  end

  describe '#manifest' do

    it 'will be a manifest loaded from disk' do
      write_config
      in_testdir do
        Vendorize.manifest.count.should be >= 1
      end
    end
  end

  describe '#update!' do

    context 'when a valid configuration exists' do

      it 'downloads the assets and places them in the vendor path' do
        write_config
        in_testdir do
          Vendorize.update!
        end
        file_should_exist('vendor/assets/javascripts/jquery.js')
      end
    end

    context 'when an invalid configuration file exists' do

      it 'will raise an error' do
        lambda {
          in_testdir do
            Vendorize.update!
          end
        }.should raise_error
      end
    end

    context 'when a no configuration file exists' do

      it 'will raise an error' do
        lambda {
          in_testdir do
            Vendorize.update!
          end
        }.should raise_error
      end
    end
  end
end
