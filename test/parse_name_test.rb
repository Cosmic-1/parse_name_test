# frozen_string_literal: true

require_relative 'base_test'

class ParseNameTest < BaseTest
  def setup
    @parse_name = Parse::Name.new
    @parse_name.login!
    @names = @parse_name.take_list_names
  end

  def teardown
    @parse_name.logout!
  end

  def test_take_names
    assert_equal 20, @names.size
  end

  def test_switching_pages
    @parse_name.next_page!
    next_names = @parse_name.take_list_names
    refute_equal @names, next_names

    @parse_name.previous_page!
    previous_names = @parse_name.take_list_names
    assert_equal @names, previous_names
  end
end
