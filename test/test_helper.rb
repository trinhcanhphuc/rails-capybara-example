ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Give us access to browser console logs, see spec/support/browser_logging.rb
logging_preferences = { browser: 'ALL' }

# This env var comes from chromedriver_linux64, used on the TravisCI
chrome_bin = ENV.fetch('CHROME_BIN', nil)
chrome_options = {}
chrome_options[:binary] = chrome_bin if chrome_bin

# Give us access to browser console logs, see spec/support/browser_logging.rb
logging_preferences = { browser: 'ALL' }

Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: chrome_options,
    loggingPrefs: logging_preferences
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: chrome_options.merge(args: %w(headless disable-gpu)),
    loggingPrefs: logging_preferences
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
