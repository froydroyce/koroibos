class OlympianFacade
  def initialize(age)
    @age = age
  end

  def olympians
    if @age
      Olympian.by_age(@age).includes(:team, :sport, :total_medals_won)
    else
      Olympian.includes(:team, :sport, :total_medals_won)
    end
  end
end
