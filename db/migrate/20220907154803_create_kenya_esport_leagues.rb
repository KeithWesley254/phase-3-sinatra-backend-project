class CreateKenyaEsportLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :kenya_esport_leagues do |t|
      t.string :league_name
      t.integer :played
      t.integer :won
      t.integer :lost
      t.integer :drawn
      t.integer :points
    end
  end
end
