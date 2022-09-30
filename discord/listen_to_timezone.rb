def listen_to_timezone(bot)
  bot.command(:timezone, description: "Permet à l'utilisateur de changer son fuseau horaire pour l'affichage de ses résultats") do |event|
    private_id = event.user.id
    event.message.author.pm("Si tu veux changer le fuseau horaire pour l'affichage de tes résulats, clique sur ce lien: https://alfrediscord.herokuapp.com/region?private_id=#{private_id}")
  end
end
