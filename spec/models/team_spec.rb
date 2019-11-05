require 'rails_helper'

RSpec.describe Team do
  describe 'relations' do
    it { should have_many :olympians }
  end
end
