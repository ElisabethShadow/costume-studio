class Costume < ApplicationRecord
  belongs_to :user_id
  # has_many :bookings
  validates :name, :size, :category, :price, :description, :user_id, presence: true
end
