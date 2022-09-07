class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :team_owner
      t.string :founded
      t.string :description
      t.string :league
      t.integer :game_id
      t.timestamps
    end
  end
end
