require 'telegram/bot'
require_relative '../lib/listings.rb'
require_relative '../lib/keyboard.rb'

token = '1344544400:AAEAmz4FxJ7Rgk7L0zgxVxcENwydlK6CkXI'
type = nil
genre = nil
type_kb = Keyboard.new('Movies', 'Series')
genre_kb = Keyboard.new('Action', 'Comedy', 'Drama', 'Romance', 'Horror')

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text == '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}, I'm here to help you choose")

      bot.api.send_message(chat_id: message.chat.id, text: 'What do you want to watch?', reply_markup: type_kb.markup)
    elsif message.text == '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye #{message.from.first_name}, make sure to get popcorns!")
    elsif type_kb.button.include? message.text

      bot.api.send_message(chat_id: message.chat.id, text: "What kind of #{message.text}?", reply_markup: genre_kb.markup)
      type = message.text
    elsif !type.nil? && (genre_kb.button.include? message.text)

      bot.api.send_message(chat_id: message.chat.id, text: "Ok, let me get #{message.text} #{type} for you")
      genre = message.text

      recomended = Chooser.recomendation(type, genre)
      title = recomended.keys[0]
      url = recomended.values[0]

      recomendation_kb = InlineKeyboard.new(title, url, title, url)

      recomendation_kb.markup

      bot.api.send_message(chat_id: message.chat.id, text: 'Take a look at this one', reply_markup: recomendation_kb.markup)
    end
  end
end
