# @!attribute [r] id
#   @return [Integer] the unique identifier for the prediction
# @!attribute [rw] user_id
#   @return [Integer] foreign key reference to the user who made this prediction
# @!attribute [rw] entry_id
#   @return [Integer] foreign key reference to the entry being predicted
# @!attribute [rw] predicted_place
#   @return [Integer] the predicted finishing position for the entry
# @!attribute [rw] notes
#   @return [Text] optional notes or reasoning for this prediction
# @!attribute [r] created_at
#   @return [DateTime] when the prediction was created
# @!attribute [r] updated_at
#   @return [DateTime] when the prediction was last updated
#
# @!method user
#   @return [User] the user who made this prediction
# @!method entry
#   @return [Entry] the entry for which this prediction was made
#
# Represents a user's prediction for the finishing position of a specific Eurovision entry.
# This allows content creators to rank entries based on their analysis and share
# these predictions with their audience. This model specifically handles place/position
# predictions.
class EntryRankingPlacePrediction < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :predicted_place, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :notes, length: { maximum: 500 }, allow_blank: true

  # Ensure uniqueness - one prediction per entry per user
  validates :entry_id, uniqueness: { scope: :user_id }
end
