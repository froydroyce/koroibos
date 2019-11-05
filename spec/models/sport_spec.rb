require 'rails_helper'

RSpec.describe Sport do
  describe 'relations' do
    it { should have_many :events }
    it { should have_many :olympians }
  end
end
