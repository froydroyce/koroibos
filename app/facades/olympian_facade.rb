class OlympianFacade
  def olympians
    Olympian.includes(:team, :sport, :total_medals_won)
  end
end
