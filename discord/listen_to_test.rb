require File.expand_path(File.join(File.dirname(__FILE__), 'helpers/set_timezone'))

@regions_list = world_regions.map!.with_index { |w_r, i| "#{i + 1}/ #{w_r}" }

def listen_to_test(bot)
  bot.command(:test) do |event|
    event.message.author.pm 'Dans quelle région vis-tu ?'
    event.message.author.pm @regions_list.join("\n")

    bot.add_await!(Discordrb::Events::MessageEvent) { |message| @user_region = message.content; true }
    p @user_region
    event.message.author.pm region_zones(@user_region).join("\n")
    nil
  end
end
