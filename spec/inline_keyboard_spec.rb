require 'telegram/bot'
require_relative '../lib/keyboard.rb'
require_relative '../lib/inline_keyboard.rb'

describe InlineKeyboard do
  let(:inline_keyboard) { InlineKeyboard.new('Title', 'url') }

  describe '#buttons' do
    it 'returns a Telegram InlineKeyboardButton instance' do
      expect(inline_keyboard.buttons).to be_a Telegram::Bot::Types::InlineKeyboardButton
    end
  end

  describe '#markup' do
    it 'returns the markup for the InlineKeyboardButton' do
      expect(inline_keyboard.markup).to be_a Telegram::Bot::Types::InlineKeyboardMarkup
    end
  end
end
