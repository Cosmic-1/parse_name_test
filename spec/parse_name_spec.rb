# frozen_string_literal: true

require_relative 'spec_helper'

describe Parse::Name do
  before do
    @parse_name = Parse::Name.new
    @parse_name.login!
  end

  after do
    @parse_name.logout!
  end

  it 'signed in or not' do
    expect @parse_name.signed_in?
  end

  it 'take all names' do
    names = @parse_name.take_list_names(1)

    expect(20).to eq(names.size)

    names2 = @parse_name.take_list_names(2)

    expect(names2).to_not eq(names)
  end
end
