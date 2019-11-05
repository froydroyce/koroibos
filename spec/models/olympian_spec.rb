require 'rails_helper'

RSpec.describe Olympian do
  describe 'relations' do
    it { should belong_to :team }
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many :events }
  end

  describe 'Class methods' do
    before(:each) do
      @korea = Team.create!(name: "South Korea")
      @usa = Team.create!(name: "United States")
      @taekwondo = Sport.create!(name: "Tae Kwon Do")
      @boxing = Sport.create!(name: "Boxing")
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
        age: 36,
        sex: "M",
        weight: 185,
        height: 60,
        team: @usa,
        sport: @boxing
      )
    end

    it ".by_age(age)" do
      expect(Olympian.by_age("youngest").take).to eq(@sejin)
      expect(Olympian.by_age("oldest").take).to eq(@jaren)
    end
  end
end
