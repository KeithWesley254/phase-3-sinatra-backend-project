class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :slogan
      t.string :role_played
      t.integer :team_id
      t.timestamps
    end
  end
end
