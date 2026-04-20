# frozen_string_literal: true

class CreateEasterEggs < ActiveRecord::Migration[8.1]
  def change
    create_table :easter_eggs do |t|
      t.references :discoverer, foreign_key: { to_table: :hunters }
      t.string :code
      t.float :latitude
      t.float :longitude
      t.string :clue
      t.boolean :found, default: false

      t.timestamps
    end

    add_index :easter_eggs, :code, unique: true
  end
end
