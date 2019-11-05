class EventSerializer
  include FastJsonapi::ObjectSerializer
  set_type :sport
  
  attributes :name

  attributes :events do |obj|
    obj.events.pluck(:name)
  end
end
