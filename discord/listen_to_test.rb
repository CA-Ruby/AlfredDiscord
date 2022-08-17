require File.expand_path(File.join(File.dirname(__FILE__), 'helpers/set_timezone'))

@regions_list = world_regions

def listen_to_test(bot)
  bot.command(:test) do |event|
    ?private_id=454248047187329024
  end
end
