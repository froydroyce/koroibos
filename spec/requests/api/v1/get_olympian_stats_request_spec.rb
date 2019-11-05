require 'rails_helper'

RSpec.describe 'Olympians API' do
  describe 'GET olympians stats request' do
    before(:each) do
      @korea = Team.create!(name: "South Korea")
      @usa = Team.create!(name: "United States")
      @taekwondo = Sport.create!(name: "Tae Kwon Do")
      @boxing = Sport.create!(name: "Boxing")
      @sejin = Olympian.create!(
        name: "Sejin Kim",
        age: 31,
        sex: "M",
        weight: 60,
        height: 60,
        team: @korea,
        sport: @taekwondo
      )
      @maria = Olympian.create!(
        name: "Maria Kim",
        age: 25,
        sex: "F",
        weight: 40,
        height: 60,
        team: @korea,
        sport: @taekwondo
      )
      @jaren = Olympian.create!(
        name: "Jaren Kim",
        age: 4,
        sex: "M",
        weight: 23,
        height: 60,
        team: @usa,
        sport: @boxing
      )
      @jamie = Olympian.create!(
        name: "Jamie Kim",
        age: 7,
        sex: "F",
        weight: 21,
        height: 60,
        team: @usa,
        sport: @boxing
      )
    end

    it "returns a stats for all olympians" do
      get '/api/v1/olympian_stats'

      expect(response).to be_successful

      stats = JSON.parse(response.body)

      expect(stats["data"].count).to eq(3)
      expect(stats["data"]).to have_key("id")
      expect(stats["data"]).to have_key("type")
      expect(stats["data"]["attributes"]).to have_key("total_competing_olympians")
      expect(stats["data"]["attributes"]).to have_key("average_age")
      expect(stats["data"]["attributes"]["average_weight"]).to have_key("unit")
      expect(stats["data"]["attributes"]["average_weight"]).to have_key("male_olympians")
      expect(stats["data"]["attributes"]["average_weight"]).to have_key("female_olympians")
    end
  end
end
