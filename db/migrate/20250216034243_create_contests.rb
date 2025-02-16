class CreateContests < ActiveRecord::Migration[8.0]
  def change
    create_table :contests do |t|
      t.integer :year
      t.references :host_country, null: false, foreign_key: { to_table: :countries }
      t.string :host_city
      t.string :slogan
      t.datetime :grand_final_date
      t.datetime :first_semifinal_date
      t.datetime :second_semifinal_date

      t.timestamps
    end
  end
end
