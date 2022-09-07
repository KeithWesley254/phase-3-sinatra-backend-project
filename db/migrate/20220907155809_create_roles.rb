class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.string :image_url
      t.string :description
      t.timestamps
    end
  end
end
