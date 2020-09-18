class InlineKeyboard < Keyboard
  def buttons
    Telegram::Bot::Types::InlineKeyboardButton.new(text: button[0], url: button[1])
  end

  def markup
    Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons)
  end
end
