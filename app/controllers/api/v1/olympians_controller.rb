class Api::V1::OlympiansController < ApplicationController
  before_action :olympian_facade, only: :index

  def index
    render json: OlympianSerializer.new(@facade.olympians)
  end

  private

  def olympian_facade
    @facade = OlympianFacade.new
  end
end
