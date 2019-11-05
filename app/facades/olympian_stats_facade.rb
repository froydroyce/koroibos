class OlympianStatsFacade
  attr_reader :id

  def total_competing_olympians
    Olympian.all.size
  end

  def average_weight
    {
      unit: "kg",
      male_olympians: Olympian.avg_weight("M").to_f.round(1),
      female_olympians: Olympian.avg_weight("F").to_f.round(1)
    }
  end

  def average_age
    Olympian.avg_age.to_f.round(1)
  end
end
