def listen_to_hello(bot)
  bot.message(with_text: 'Hello!') do |event|
    user_id = event.user.id
    username = event.user.username
    if User.find_by(id: user_id)
      event.respond "Salut, #{username}!"
    else
      event.respond "Enchanté #{username}!"
      User.create(id: user_id, name: username)
    end
  end
end
