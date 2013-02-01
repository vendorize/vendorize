Feature: It generates a configuration file
  As a vendorize user
  I want a configuration file
  So I can configure vendorize

  Scenario: Generate a configuration file
    Given I create a new rails project
    And I add the vendorize gem to the project
    When I run `bundle exec rails g vendorize:config`
    Then a file named "config/vendorize.rb" should exist
    Then the file "config/vendorize.rb" should contain exactly:
    """

    vendorize :jquery do
      version '1.9.0'

      javascript 'jquery.js',     "http://code.jquery.com/jquery-#{version}.js"
      javascript 'jquery.min.js', "http://code.jquery.com/jquery-#{version}.min.js"
    end

    """
