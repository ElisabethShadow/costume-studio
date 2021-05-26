class Costume < ApplicationRecord

  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :size, :category, :price, :description, :user, presence: true
  # validates :category, inclusion: { in: CATEGORIES }

  def self.categories
    [ "Halloween", "Pirates", "Cowbow", "Carnival", "Monster", "Middle Age", "Superhero", "Fantasy", "Anime", "Strange", "Weird", "Super Weird", "Disgusting" ]
  end
end
