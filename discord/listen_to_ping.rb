def listen_to_ping(bot)

  bot.message(with_text: 'Ping!') do |event|
      event.respond 'Pong!'
  end
  
end
