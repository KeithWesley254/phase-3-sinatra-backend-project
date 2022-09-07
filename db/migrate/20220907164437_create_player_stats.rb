class CreatePlayerStats < ActiveRecord::Migration[6.1]
  def change
    create_table :player_stats do |t|
      t.integer :number_of_games
      t.integer :game_duration
      t.integer :average_kills_per_game
      t.string :favourite_role
      t.belongs_to :player
    end
  end
end
