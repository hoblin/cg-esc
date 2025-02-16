# frozen_string_literal: true

class SeedUsers < ActiveRecord::Migration[8.0]
  def up
    Rails.application.credentials.default_users!.each do |user|
      User.create!(user)
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
