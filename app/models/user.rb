class User < ApplicationRecord
  has_many :sleep_records

  validates :name, presence: true
end
