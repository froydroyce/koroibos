class Api::V1::OlympianStatsController < ApplicationController
  before_action :stats_facade

  def index
    render json: OlympianStatsSerializer.new(@stats_facade)
  end

  private

  def stats_facade
    @stats_facade = OlympianStatsFacade.new
  end
end
