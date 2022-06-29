def listen_to_hello(bot)

    bot.message(with_text: 'Hello!') do |event|
        private_id = event.user.id
        first_name = event.user.username
        if User.find_by(private_id: private_id)
            event.respond "Hi, #{first_name} on se connait!"
        else
            event.respond "ah mais je ne te connaissait pas mais maintenant on se connait #{event.user.username}"
            User.create(private_id: private_id, first_name: first_name )
        end
    end

end