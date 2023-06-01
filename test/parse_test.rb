# frozen_string_literal: true

require_relative './base_parse'

class ParseTest < BaseParse
  def test_take_names_from_page
    visit 'members/list/'

    loop do
      all(:xpath, './/ol/li').each do |li|
        puts li.find(:xpath, './/h3/a').text
      end

      break unless page.has_link? 'Next'

      click_link 'Next'
    end
  end
end
