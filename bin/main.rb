require 'telegram/bot'
require_relative '../lib/listings.rb'
require_relative '../lib/keyboard.rb'
require_relative '../lib/inline_keyboard.rb'
require_relative '../lib/message.rb'

token = '1378638620:AAGZMZmjr7GiM12MZ-NMrYW66IbUQfZ1bjs'
type = nil
genre = nil
type_kb = Keyboard.new('Movies', 'Series')
genre_kb = Keyboard.new('Action', 'Comedy', 'Drama', 'Romance', 'Horror')

Telegram::Bot::Client.run(token) do |bot|
  include Message
  bot.listen do |user|
    if user.text == '/start'

      bot.api.welcome(user)
      bot.api.ask_type(user, type_kb.markup)

    elsif user.text == '/stop'

      bot.api.bye(user)

    elsif type_kb.button.include? user.text

      type = user.text
      bot.api.ask_genre(user, type, genre_kb.markup)

    elsif !type.nil? && (genre_kb.button.include? user.text)

      genre = user.text
      bot.api.procces(user, type, genre)
      bot.api.recomend(user, type, genre)

    end
  end
end
