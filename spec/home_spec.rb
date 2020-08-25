# spec/features/create_user.rb
require 'rails_helper'

describe 'check home page', type: :feature, js: true do
  it 'successfully go home page' do
    visit '/welcome/index'

    expect(page).to have_content 'Welcome#index'
    expect(page).to have_content 'Find me in app/views/welcome/index.html.erb'
    # sleep(5)
    visit 'https://www.google.com'
  end
end
