class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  def start_test
    # Define random new Time
    tableau_intervals = []
    total = 0
    current_time = Time.now
    loop do
      nouveau_temps = (60 + rand(60))#3600,5400
      current_time += nouveau_temps
      total += nouveau_temps
      tableau_intervals << current_time.iso8601
    end until total > 500 # 8000

    intervals = ''
    tableau_intervals.each do |i|
      intervals << i
      intervals << ' '
    end

    # Then change user attributes in db
    update(flow_test_intervals: intervals, flow_testing: true)
  end

  def stop_test
    intervals = []
    update(flow_test_intervals: intervals, flow_testing: false)
  end
end
