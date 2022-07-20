class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :flow_entries

  def start_test
    # Définit les heures auxquelles le formulaire va s'envoyer
    tableau_intervals = []
    total = 0
    current_time = Time.zone.now
    loop do
      nouveau_temps = rand(3600..5400)
      current_time += nouveau_temps
      total += nouveau_temps
      tableau_intervals << current_time.iso8601
      break unless total <= 80_000
    end

    intervals = ''
    tableau_intervals.each do |i|
      intervals << i
      intervals << ' '
    end

    update(flow_test_intervals: intervals, flow_testing: true)
  end

  def stop_test
    intervals = []
    update(flow_test_intervals: intervals, flow_testing: false)
  end
end
