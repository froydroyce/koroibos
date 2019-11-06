class EventMedalistSerializer
  include FastJsonapi::ObjectSerializer

  attributes :event do |obj|
    obj.medalists[0].event
  end

  attributes :medalists do |obj|
    obj.medalists.map do |medalist|
      {
        name: medalist.name,
        team: medalist.team.name,
        age: medalist.age,
        medal: medalist.medal
      }
    end
  end
end
