# frozen_string_literal: true

class Create2025Contest < ActiveRecord::Migration[8.0]
  def up
    host = Country.find_by!(code: 'CHE')

    Contest.create!(
      year: 2025,
      host_country: host,
      host_city: 'Basel',
      first_semifinal_date: Time.parse('2025-05-13 21:00 CEST'),
      second_semifinal_date: Time.parse('2025-05-15 21:00 CEST'),
      grand_final_date: Time.parse('2025-05-17 21:00 CEST')
    )
  end

  def down
    Contest.find_by(year: 2025)&.destroy
  end
end
