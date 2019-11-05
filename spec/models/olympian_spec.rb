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

    it ".by_age(age)" do
      expect(Olympian.by_age("youngest")).to eq(@jaren)
      expect(Olympian.by_age("oldest")).to eq(@sejin)
    end

    it ".avg_weight(sex)" do
      expect(Olympian.avg_weight("M").to_f.round(1)).to eq(41.5)
      expect(Olympian.avg_weight("F").to_f.round(1)).to eq(30.5)
    end

    it ".avg_age" do
      expect(Olympian.avg_age.to_f.round(1)).to eq(16.8)
    end
  end
end
