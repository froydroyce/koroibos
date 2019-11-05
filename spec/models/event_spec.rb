require 'rails_helper'

RSpec.describe Event do
  describe 'relations' do
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many :olympians }
  end
end
