class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume

  validates :user, :costume, presence: true
  # validates :costume, uniqueness: { scope: :user }
end
