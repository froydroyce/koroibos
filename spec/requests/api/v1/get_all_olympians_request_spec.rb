require 'rails_helper'

RSpec.describe 'Olympians API' do
  describe 'GET all olympians request' do
    before(:each) do
      @korea = Team.create!(name: "South Korea")
      @usa = Team.create!(name: "United States")
      @taekwondo = Sport.create!(name: "Tae Kwon Do")
      @boxing = Sport.create!(name: "Boxing")
      @mens_tkd = Event.create!(name: "Men's Tae Kwon Do", sport: @taekwondo)
      @mens_boxing = Event.create!(name: "Men's Boxing", sport: @boxing)
      @sejin = Olympian.create!(
        name: "Sejin Kim",
        age: 31,
        sex: "M",
        weight: 185,
        height: 60,
        team: @korea,
        sport: @taekwondo
      )
      @jaren = Olympian.create!(
        name: "Jaren Kim",
        age: 31,
        sex: "M",
        weight: 185,
        height: 60,
        team: @usa,
        sport: @boxing
      )
      OlympianEvent.create!(
        olympian: @sejin,
        event: @mens_tkd,
        medal: "Gold"
      )
      OlympianEvent.create!(
        olympian: @jaren,
        event: @mens_boxing,
        medal: nil
      )
    end

    it "returns a list of all olympians" do
      get '/api/v1/olympians'

      expect(response).to be_successful

      olympians = JSON.parse(response.body)

      expect(olympians["data"].count).to eq(2)
      expect(olympians["data"][0]).to have_key("id")
      expect(olympians["data"][0]).to have_key("type")
      expect(olympians["data"][0]["attributes"]).to have_key("name")
      expect(olympians["data"][0]["attributes"]).to have_key("age")
      expect(olympians["data"][0]["attributes"]).to have_key("sport")
      expect(olympians["data"][0]["attributes"]).to have_key("team")
      expect(olympians["data"][0]["attributes"]).to have_key("total_medals_won")
    end
  end
end
