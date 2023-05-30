# frozen_string_literal: true

require 'rspec/autorun'
require_relative '/main'
require_relative '/module.rb'

describe MasterMind do
  let(:game) { MasterMind.new }
  it 'Gives feedback on how good the guess was each turn.' do
    expect(game.guess('')).to eq('')
  end
end
