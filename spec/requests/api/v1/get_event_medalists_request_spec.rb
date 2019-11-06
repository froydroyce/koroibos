require 'rails_helper'

RSpec.describe 'Olympians API' do
  describe 'GET event medalists request' do
    before(:each) do
      @korea = Team.create!(name: "South Korea")
      @usa = Team.create!(name: "United States")
      @taekwondo = Sport.create!(name: "Tae Kwon Do")
      @world_tkd = Event.create!(name: "World Tae Kwon Do", sport: @taekwondo)
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
        sport: @taekwondo
      )
      @jamie = Olympian.create!(
        name: "Jamie Kim",
        age: 7,
        sex: "F",
        weight: 21,
        height: 60,
        team: @usa,
        sport: @taekwondo
      )
      OlympianEvent.create!(
        olympian: @sejin,
        event: @world_tkd,
        medal: "Gold"
      )
      OlympianEvent.create!(
        olympian: @jaren,
        event: @world_tkd,
        medal: "Silver"
      )
      OlympianEvent.create!(
        olympian: @jamie,
        event: @world_tkd,
        medal: "Bronze"
      )
      OlympianEvent.create!(
        olympian: @maria,
        event: @world_tkd,
        medal: nil
      )
    end

    it "returns a specific event with its medalists" do
      get "/api/v1/events/#{@world_tkd.id}/medalists"

      expect(response).to be_successful

      event = JSON.parse(response.body)

      expect(event["data"]).to have_key("id")
      expect(event["data"]).to have_key("type")
      expect(event["data"]["attributes"]).to have_key("event")
      expect(event["data"]["attributes"]["medalists"].count).to eq(3)
      expect(event["data"]["attributes"]["medalists"][0]).to have_key("name")
      expect(event["data"]["attributes"]["medalists"][0]).to have_key("team")
      expect(event["data"]["attributes"]["medalists"][0]).to have_key("age")
      expect(event["data"]["attributes"]["medalists"][0]).to have_key("medal")
    end
  end
end
