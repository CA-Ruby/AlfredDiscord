class User < ApplicationRecord

  validates :first_name, presence: true, length: { maximum: 50 }
end
