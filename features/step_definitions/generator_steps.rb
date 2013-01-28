Given /^I create a new rails project$/ do
  @project_name = 'vendorize_test'
  steps %Q{
    When I successfully run `bundle exec rails new #{@project_name} --skip-bundle`
    Then a directory named "vendorize_test" should exist
  }
end

Given /^I add the vendorize gem to the project$/ do
  steps %Q{
    When I cd to "#{@project_name}"
    And a file named "Gemfile" should exist
    And I append to "Gemfile" with:
      """
        gem 'vendorize'
      """
    Then the file "Gemfile" should contain "gem 'vendorize'"
    And I successfully run `bundle install --path .bundle/bundle`
  }
end
