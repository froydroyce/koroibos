require 'rails_helper'

RSpec.describe 'Olympians API' do
  describe 'GET all events request' do
    before(:each) do
      @taekwondo = Sport.create!(name: "Tae Kwon Do")
      @boxing = Sport.create!(name: "Boxing")
      @mens_tkd = Event.create!(name: "Men's Tae Kwon Do", sport: @taekwondo)
      @womens_tkd = Event.create!(name: "Women's Tae Kwon Do", sport: @taekwondo)
      @mens_boxing = Event.create!(name: "Men's Boxing", sport: @boxing)
      @womens_boxing = Event.create!(name: "Women's Boxing", sport: @boxing)
    end

    it "returns a list of all events" do
      get '/api/v1/events'

      expect(response).to be_successful

      events = JSON.parse(response.body)

      expect(events["data"].count).to eq(2)
      expect(events["data"][0]).to have_key("id")
      expect(events["data"][0]).to have_key("type")
      expect(events["data"][0]["attributes"]).to have_key("name")
      expect(events["data"][0]["attributes"]).to have_key("events")
      expect(events["data"][0]["attributes"]["events"].count).to eq(2)
    end
  end
end
