# frozen_string_literal: true

require_relative 'helper'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://forum.gamemaker.io/'
end
