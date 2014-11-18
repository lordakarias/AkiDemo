require 'csv'

class Match < ActiveRecord::Base

  def self.import_from_csv(file_path)

    CSV.foreach(Rails.root.join(file_path), headers: true) do |row|
      match_table = row[0].split(" ")

      Match.create(
        team1: match_table[0],
        team2: match_table[1],
        place: match_table[2],
        date: match_table[3],
        price: match_table[4]
        
      )

    end
  end

	def self.import
	    import_from_csv('csvs/match.csv')

  	end
end


