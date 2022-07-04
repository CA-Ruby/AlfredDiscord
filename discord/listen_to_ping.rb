def listen_to_ping(bot)
  bot.command(:ping) do |event|
      event.respond 'Pong!'
  end
  
end
