class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 }

  def start_test
    # Define random new Time
    tableau_intervalles = []
    total = 0
    current_time = Time.now
    begin
      nouveau_temps = (3600 + rand(5400))
      current_time = current_time + nouveau_temps
      total = total + nouveau_temps
      tableau_intervalles << current_time.iso8601
    end until total > 80000
  
    intervalles = ""
    tableau_intervalles.each do |i|
      intervalles << i
      intervalles << " "
    end
  
    # Then change user attributes in db
    current_user = self
    current_user.update(:flow_test_intervals => intervalles, :flow_testing => true)
  end

  def stop_test
    current_user = self
    current_user.update(:flow_testing => false)
  end
  
end
