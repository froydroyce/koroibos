class Sport < ApplicationRecord
  has_many :events
  has_many :olympians
end
