class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :team1
      t.string :team2
      t.string :place
      t.string :date
      t.string :price

      t.timestamps
    end
  end
end
