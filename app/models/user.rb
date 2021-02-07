class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :venue_users, dependent: :destroy
  has_many :venues, through: :venue_users

  has_many :movie_votes
  has_many :participations
  has_many :maybe_participations
end
