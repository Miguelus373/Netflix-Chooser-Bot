module Message
  def welcome(user)
    send_message(
      chat_id: user.chat.id,
      text: "Hello #{user.from.first_name}, I'm here to help you choose"
    )
  end

  def bye(user)
    send_message(
      chat_id: user.chat.id,
      text: "Bye #{user.from.first_name}, make sure to get popcorns!"
    )
  end

  def ask_type(user, keyboard)
    send_message(
      chat_id: user.chat.id,
      text: 'What do you want to watch?',
      reply_markup: keyboard
    )
  end

  def ask_genre(user, type, keyboard)
    send_message(
      chat_id: user.chat.id,
      text: "What kind of #{type}?",
      reply_markup: keyboard
    )
  end

  def procces(message, type, genre)
    send_message(
      chat_id: message.chat.id,
      text: "Ok, let me get #{genre} #{type} for you"
    )
  end

  def recomend(message, type, genre)
    recomended = Chooser.recomendation(type, genre)

    send_message(
      chat_id: message.chat.id, text: 'Take a look at this one:',
      reply_markup: InlineKeyboard.new(recomended.keys[0], recomended.values[0]).markup
    )
  end
end
