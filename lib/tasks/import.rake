require 'csv'

namespace :import do
  desc "Import olympian data from csv file"
  task csv: :environment do
    options = {
      header_converters: :symbol,
      headers: true
    }

    CSV.foreach('./lib/data/olympians.csv', options) do |row|
      team = Team.find_or_create_by(name: row[:team])

      sport = Sport.find_or_create_by(name: row[:sport])

      olympian = Olympian.find_or_create_by(name: row[:name]) do |new_olym|
        new_olym.sex = row[:sex]
        new_olym.age = row[:age]
        new_olym.weight = row[:weight]
        new_olym.height = row[:height]
        new_olym.team = team
        new_olym.sport = sport
      end

      event = Event.find_or_create_by(name: row[:event]) do |new_event|
        new_event.sport = sport
      end

      olympian.olympian_events.find_or_create_by(event: event) do |new_event|
        if row[:medal] == "NA"
          new_event.medal = nil
        else
          new_event.medal = row[:medal]
        end
      end
    end
  end
end
