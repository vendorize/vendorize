Feature: It generates a configuration file
  As a vendorize user
  I want a configuration file
  So I can configure vendorize

  @announce
  Scenario: Generate a configuration file
    Given I create a new rails project
    And I add the vendorize gem to the project
    When I run `bundle exec rails g vendorize:config`
    Then a file named "config/vendorize.rb" should exist
