# frozen_string_literal: true

require_relative 'helper'

module Parse
  class Name
    include Capybara::DSL

    def login!(login = 'mamipa4200@pyadu.com', password = 'mamipa4200@pyadu.com')
      visit 'login'

      click_button 'Accept cookies'

      within(:xpath, './/div/div/div/form') do
        fill_in 'login', with: login
        fill_in 'password', with: password
        click_on 'Log in'
      end
    end

    def signed_in?(name = 'mamipa4200')
      page.has_content?(name)
    end

    def logout!
      Capybara.reset_sessions!
    end

    def take_list_names(number_page)
      array = []
      visit "index.php?members/list/&page=#{number_page}"

      all(:xpath, './/ol/li').each do |li|
        array << li.find(:xpath, './/h3/a').text
      end

      array
    end
  end
end
