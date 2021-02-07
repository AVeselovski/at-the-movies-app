class Venue < ApplicationRecord
  has_many :venue_users, dependent: :destroy
  has_many :users, through: :venue_users
  has_many :movies

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :location, presence: true, length: { minimum: 3 }
end
