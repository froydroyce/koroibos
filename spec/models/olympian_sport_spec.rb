require 'rails_helper'

RSpec.describe OlympianSport do
  describe 'relations' do
    it { should belong_to :olympian }
    it { should belong_to :sport }
  end
end
