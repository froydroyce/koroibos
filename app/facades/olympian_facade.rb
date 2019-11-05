class OlympianFacade
  def initialize(age)
    @age = age
  end

  def olympians
    if @age
      Olympian.includes(:team, :sport, :total_medals_won).by_age(@age)
    else
      Olympian.includes(:team, :sport, :total_medals_won)
    end
  end
end
