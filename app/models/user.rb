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

# @!attribute [r] id
#   @return [Integer] the unique identifier for the user
# @!attribute [rw] email_address
#   @return [String] the user's email address (normalized to lowercase)
# @!attribute [rw] password_digest
#   @return [String] the secure digest of the user's password
# @!attribute [r] created_at
#   @return [DateTime] when the record was created
# @!attribute [r] updated_at
#   @return [DateTime] when the record was last updated
# @!attribute [rw] settings
#   @return [Hash] JSON-encoded user settings
# @!attribute [rw] contest_id
#   @return [Integer] ID of the currently selected contest (stored in settings)
#
# @!method sessions
#   @return [ActiveRecord::Relation<Session>] all sessions associated with this user
# @!method entry_ranking_place_predictions
#   @return [ActiveRecord::Relation<EntryRankingPlacePrediction>] all place predictions made by this user
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :entry_ranking_place_predictions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  store :settings, accessors: %i[contest_id], coder: JSON

  # @return [Contest] The user's currently selected contest
  # @note If no contest is selected, it defaults to the next upcoming contest
  def contest
    set_default_contest_id

    Contest.find(contest_id)
  end

  private

  # Updates the contest_id if it's not set.
  # Finds the next contest based on current date
  # and the contest grand_final_date.
  # @return [Integer, nil] The ID of the selected contest or nil if already set
  def set_default_contest_id
    return if contest_id.present?

    update(contest_id: Contest.where("grand_final_date > ?", Date.current).order(grand_final_date: :asc).first.id)
  end
end
