def listen_to_hello(bot)
  bot.command(:hello, description: "Permet au bot d'enregistrer l'utiilisateur si c'est la première fois qu'il lance la commande.") do |event|
    private_id = event.user.id
    user_name = event.user.username
    if User.find_by(private_id: private_id)
      event.message.author.pm "Bonjour, #{user_name}!"
    else
      event.message.author.pm "Enchanté, #{user_name}!"
      User.create(private_id: private_id, name: user_name)
      nil
    end
  end
end
