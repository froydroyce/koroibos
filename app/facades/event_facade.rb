class EventFacade
  attr_reader :id

  def initialize(id)
    @event_id = id
  end

  def medalists
    Olympian.includes(:team).event_medalists(@event_id)
  end
end
