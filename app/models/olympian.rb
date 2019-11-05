class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :total_medals_won, -> { medals }, class_name: "OlympianEvent"

  default_scope { order(id: :asc) }
end
