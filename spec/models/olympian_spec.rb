require 'rails_helper'

RSpec.describe Olympian do
  describe 'relations' do
    it { should belong_to :team }
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many :events }
  end
end
