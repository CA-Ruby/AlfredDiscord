def listen_to_hello(bot)
  bot.command(:hello, description: "Permet au bot d'enregistrer l'utiilisateur si c'est la première fois qu'il lance la commande.") do |event|
    user_id = event.user.id
    user_name = event.user.username
    if User.find(user_id)
      event.respond "Bonjour, #{user_name}!"
    else
      event.respond "Enchanté, #{user_name}!"
      User.create(id: user_id, name: user_name)
      nil
    end
  end
end
