class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.references :contest, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.string :artist_name
      t.string :song_title
      t.text :lyrics
      t.text :en_lyrics
      t.integer :semifinal
      t.integer :semifinal_order
      t.integer :final_order
      t.boolean :qualified

      t.timestamps
    end
  end
end
