require "application_system_test_case"

class HelloWorldTest < ApplicationSystemTestCase
  test "user visits front page" do
    visit root_url
    assert_text "Hello, World!"
  end
end
