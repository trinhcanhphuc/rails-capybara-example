require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/welcome/index'
    print page.driver.browser.manage.logs.get(:browser)

    assert true
  end
end
