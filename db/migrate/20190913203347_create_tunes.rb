class CreateTunes < ActiveRecord::Migration[6.0]
  def change
    create_table :tunes do |t|
      t.string :name
      t.string :artist
      t.string :genre
      t.belongs_to :chart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
