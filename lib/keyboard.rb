require 'telegram/bot'

class Keyboard
  attr_reader :button

  def initialize(*button)
    @button = button
  end

  def buttons
    reply = []
    (0...button.length).each do |i|
      reply.push(Telegram::Bot::Types::KeyboardButton.new(text: button[i]))
    end
    reply
  end

  def markup
    Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: buttons)
  end
end

class InlineKeyboard < Keyboard
  def buttons
    Telegram::Bot::Types::InlineKeyboardButton.new(text: button[0], url: button[1])
  end

  def markup
    Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
  end
end
