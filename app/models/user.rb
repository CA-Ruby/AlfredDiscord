class User < ApplicationRecord

  require 'discordrb'

  bot = Discordrb::Commands::CommandBot.new(
    token: Rails.application.credentials.discord[:token],
    client_id: Rails.application.credentials.discord[:client_id],
    prefix: '!'
  )

  validates :name, presence: true, length: { maximum: 50 }

  def start_test
    # Define random new Time
    tableau_intervals = []
    total = 0
    current_time = Time.now
    begin
      nouveau_temps = (60+ rand(60))#3600,5400
      current_time = current_time + nouveau_temps
      total = total + nouveau_temps
      tableau_intervals << current_time.iso8601
    end until total > 500#8000
  
    intervals = ""
    tableau_intervals.each do |i|
      intervals << i
      intervals << " "
    end
  
    # Then change user attributes in db
    current_user = self
    current_user.update(:flow_test_intervals => intervals, :flow_testing => true)
  end

  def stop_test
    current_user = self
    intervals = []
    current_user.update(:flow_test_intervals => intervals, :flow_testing => false)
  end
  
end
