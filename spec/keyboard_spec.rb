require_relative '../lib/keyboard.rb'

describe Keyboard do
  let(:keyboard) { Keyboard.new('Action', 'Comedy', 'Drama') }

  describe '#button' do
    it 'return the array instance of the Keyboard class' do
      expect(keyboard.button).to eql(%w[Action Comedy Drama])
    end
  end

  describe '#buttons' do
    it 'returns an array of Telegram KeyboardButtons' do
      expect(keyboard.buttons).to be_an Array
    end
  end

  describe '#markup' do
    it 'returns an instance of the Telegram ReplyKeyboardMarkup class' do
      expect(keyboard.markup).to be_a Telegram::Bot::Types::ReplyKeyboardMarkup
    end
  end
end

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
