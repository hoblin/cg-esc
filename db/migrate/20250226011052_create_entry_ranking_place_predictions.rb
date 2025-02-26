class CreateEntryRankingPlacePredictions < ActiveRecord::Migration[8.0]
  def change
    create_table :entry_ranking_place_predictions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true
      t.integer :predicted_place, null: false
      t.text :notes

      t.timestamps
    end

    # Ensure each user can only have one prediction per entry
    add_index :entry_ranking_place_predictions, [:user_id, :entry_id], unique: true,
              name: 'index_entry_ranking_place_predictions_on_user_and_entry'
  end
end
