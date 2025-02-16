# frozen_string_literal: true

class CreateInitialCountries < ActiveRecord::Migration[8.0]
  def up
    Country.all_countries.each do |country|
      Country.find_or_create_by!(code: country[:code]) do |c|
        c.name = country[:name]
        c.flag = country[:flag]
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
