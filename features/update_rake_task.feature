Feature: Update the vendorized assets
  As a vendorize user
  I want a update my assets
  So I can use them in the Rails Asset Pipeline

  Scenario: Generate a configuration file
    Given I create a new rails project and configure vendorize
    When I successfully run `bundle exec rake vendorize:update`
    Then a file named "vendor/assets/javascripts/jquery.js" should exist
    And a file named "vendor/assets/javascripts/jquery.min.js" should exist
