require 'capybara'
require 'capybara/dsl'
require 'minitest/autorun'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://forum.gamemaker.io/'
end

class BaseParse < Minitest::Test
  include Capybara::DSL

  def setup
    Capybara.reset_sessions!
    login!
  end

  protected

  def login!
    visit 'login'

    click_button 'Accept cookies'

    within(:xpath, './/div/div/div/form') do
      fill_in 'login', with: 'mamipa4200@pyadu.com'
      fill_in 'password', with: 'mamipa4200@pyadu.com'
      click_on 'Log in'
    end
  end
end
