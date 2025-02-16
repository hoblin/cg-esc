# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email_address   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  store :settings, accessors: %i[contest_id], coder: JSON

  def contest
    set_default_contest_id

    Contest.find(contest_id)
  end

  private

  # Updates the contest_id if it's not set.
  # Finds the next contest based on current date
  # and the contest grand_final_date.
  def set_default_contest_id
    return if contest_id.present?

    update(contest_id: Contest.where("grand_final_date > ?", Date.current).order(grand_final_date: :asc).first.id)
  end
end
