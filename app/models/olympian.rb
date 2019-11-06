class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :total_medals_won, -> { medals }, class_name: "OlympianEvent"

  default_scope { order(id: :asc) }

  def self.by_age(age)
    if age == "youngest"
      sort = :ASC
    else
      sort = :DESC
    end
    unscoped.order(age: sort).limit(1).take
  end

  def self.avg_weight(sex)
    where({sex: sex}).average(:weight)
  end

  def self.avg_age
    average(:age)
  end

  def self.event_medalists(id)
    select("olympians.*, olympian_events.medal AS medal, events.name AS event")
      .joins(:olympian_events, :events)
      .where(olympian_events: {event_id: id})
      .merge(OlympianEvent.medals)
  end
end
