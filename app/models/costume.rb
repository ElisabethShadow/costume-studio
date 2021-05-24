class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :size, :category, :price, :description, :user, presence: true
end
