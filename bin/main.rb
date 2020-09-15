require 'telegram/bot'
require_relative '../lib/listings.rb'

token = '1344544400:AAEAmz4FxJ7Rgk7L0zgxVxcENwydlK6CkXI'
type = nil
genre = nil

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text == '/start' 
        bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}, I'm here to help you choose")
        kb_type = [
          Telegram::Bot::Types::KeyboardButton.new(text:  'Movies'),
          Telegram::Bot::Types::KeyboardButton.new(text:  'Series')
        ]
        markup_type = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb_type)
        bot.api.send_message(chat_id: message.chat.id, text:  'What do you want to watch?', reply_markup: markup_type)
    elsif message.text == '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye #{message.from.first_name}, make sure to get popcorns!")
    elsif message.text == 'Movies' || message.text == 'Series'
      kb_kind = [
        Telegram::Bot::Types::KeyboardButton.new(text:  'Action'),
        Telegram::Bot::Types::KeyboardButton.new(text:  'Comedy'),
        Telegram::Bot::Types::KeyboardButton.new(text:  'Drama'),
        Telegram::Bot::Types::KeyboardButton.new(text:  'Romance'),
        Telegram::Bot::Types::KeyboardButton.new(text:  'Horror')
      ]
      markup_kind = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb_kind, one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text:  "What kind of #{message.text}?", reply_markup: markup_kind)
      type = message.text
    elsif message.text == 'Action' || message.text == 'Comedy' || 
      message.text == 'Drama' || message.text == 'Romance'|| message.text == 'Horror'
      
      bot.api.send_message(chat_id: message.chat.id, text:  "Ok, let me get #{message.text} #{type} for you")
      genre = message.text

      if (!type.nil? && !genre.nil?)
        recomended = Chooser.recomendation(type, genre)
        title = recomended.keys[0]
        url = recomended.values[0]
      end

      kb_recomendation = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: title, url: url)
      ]
      markup_recomendation = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb_recomendation)
      bot.api.send_message(chat_id: message.chat.id, text: 'Take a look at this', reply_markup: markup_recomendation)
    end
  end
end
