class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age

  attributes :sport do |olympian|
    olympian.sport.name
  end

  attributes :team do |olympian|
    olympian.team.name
  end

  attributes :total_medals_won do |olympian|
    olympian.total_medals_won.size
  end
end
