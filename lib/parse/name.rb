# frozen_string_literal: true

require_relative 'helper'
require_relative 'base'

module Parse
  class Name < Base
    def initialize
      super
      @switch_page = 1
    end

    def current_page
      @switch_page
    end

    def next_page!
      @switch_page += 1 if @switch_page >= 1
    end

    def previous_page!
      @switch_page -= 1 if @switch_page > 1
    end

    def take_list_names
      array = []
      visit "index.php?members/list/&page=#{@switch_page}"

      all(:xpath, './/ol/li').each do |li|
        array << li.find(:xpath, './/h3/a').text
      end

      array
    end
  end
end
