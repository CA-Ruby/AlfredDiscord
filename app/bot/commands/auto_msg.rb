module DiscordBot
    module Auto_msg
        extend Discordrb::Commands::CommandContainer

        

        # BOT.add_await!(60) do |guess_event|
        #     event.send_message(Time.now.strftime('%m/%d/%Y %H:%M'))
        # end

        # command(:w) do |event|
        #     event.respond "Hi, #{event.user.name}!"
        # end
  
        # date = Time.now
        
        # command(:test, description: 'Permet de tester le delay bien ') do |event|
        #     BOT.add_await!(Discordrb::Events::MessageEvent, Time.now) { if Time.now.strftime('%m/%d/%Y %H:%M') == Time.now.strftime('%m/%d/%Y %H:%M')
        #         event.send_message(Time.now.strftime('%m/%d/%Y %H:%M'))
        #     end }
        # end
        
        # rate_limiter = Discordrb::Commands::SimpleRateLimiter.new
        # rate_limiter.bucket :example, delay: 5  # 5 seconds between each execution
    
        # BOT.message(containing: ['(╯°□°）╯︵ ┻━┻', '(ﾉಥ益ಥ）ﾉ﻿ ┻━┻', '(ノಠ益ಠ)ノ彡┻━┻']) do |event|
        # next if rate_limiter.rate_limited?(:example, event.channel)
        # event.respond '┬─┬ノ( º _ ºノ)'
        # end
    

        # BOT.message(content: 'Ping!') do |event|
        #    
        # end

        # BOT.message(content: 'Ping!') do |event|
        #     # The `respond` method returns a `Message` object, which is stored in a variable `m`. The `edit` method is then called
        #     # to edit the message with the time difference between when the event was received and after the message was sent.
        #     BOT.add_await!(timeout: 60) do |msg|
        #         msg.send_message("time delay works")
        #     end
        # end

        
        # BOT.message(with_text: "Hey Bot!") do |event|
        #     sleep(60)
        #     event.respond "Hi, #{event.user.name}!"
        # end


        # BOT.add_await!(Discordrb::Events::MessageEvent) { |message| message.content == '!await' }
        # event.send_message("Fin de la récolte d'informations, merci !")
        # command(:start, description: "Lance l'algorithme pour récupérer les informations sur ton état de flow") do |event|
        #     event.send_message("Début de la récolte d'informations :teddy_bear:")
        #     event.send_message('Tu vas recevoir un formulaire à remplir plusieurs fois dans la journée, pour que je puisse évaluer ton état de flow.')
        #     BOT.add_await!(Discordrb::Events::MessageEvent) { |message| message.content == '!stop' }
        #     event.send_message("Fin de la récolte d'informations, merci !")
        # end

    end
end