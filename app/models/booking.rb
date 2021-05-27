class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  enum status: [:pending, :accepted, :rejected]
end
