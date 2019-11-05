class OlympianEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event

  scope :medals, -> { where.not(medal: nil) }
end
