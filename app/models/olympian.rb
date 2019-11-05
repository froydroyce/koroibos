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
end
