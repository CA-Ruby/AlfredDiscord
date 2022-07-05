# frozen_string_literal: true

require File.expand_path('../config/environment', __dir__)
require 'discordrb'

Dir['./discord/*.rb'].each { |file| require file unless file.include? 'commands.rb' }

bot = Discordrb::Commands::CommandBot.new(
  token: Rails.application.credentials.discord[:token],
  client_id: Rails.application.credentials.discord[:client_id],
  prefix: '!'
)

listen_to_hello(bot)
listen_to_ping(bot)
listen_to_start(bot)
listen_to_stop(bot)
listen_to_link(bot)

bot.run
