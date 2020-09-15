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
    reply = []
    (0...button.length).each do |i|
      reply.push(Telegram::Bot::Types::InlineKeyboardButton.new(text: button[i]), url: button[i+1])
      i+=1
    end
    reply
  end

  def markup
    Telegram::Bot::Types::InlineKeyboardMarkup.new(keyboard: buttons)
  end  
end