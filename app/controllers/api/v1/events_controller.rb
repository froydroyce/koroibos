class Api::V1::EventsController < ApplicationController
  before_action :event_facade

  def index
    render json: EventSerializer.new(Sport.includes(:events))
  end

  def show
    render json: EventMedalistSerializer.new(@facade)
  end

  private

  def event_facade
    @facade = EventFacade.new(params[:id])
  end
end
