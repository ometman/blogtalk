class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo_url
      t.text :bio
      t.datetime :updated_at
      t.datetime :created_at
      t.integer :posts_counter

      t.timestamps
    end

    add_index :users, :posts_counter
  end
end

