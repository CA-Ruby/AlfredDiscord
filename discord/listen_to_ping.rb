def listen_to_ping(bot)
  bot.command(:ping) do |event|
    event.message.author.pm('Pong!')
  end
end
