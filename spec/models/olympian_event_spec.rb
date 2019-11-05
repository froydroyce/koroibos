require 'rails_helper'

RSpec.describe OlympianEvent do
  describe 'relations' do
    it { should belong_to :olympian }
    it { should belong_to :event }
  end
end
