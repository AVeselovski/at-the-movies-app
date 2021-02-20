class Event < ApplicationRecord
  belongs_to :venue

  validates :event_date, presence: true
  validates :event_time, presence: true
  validates :showings, presence: true
end
