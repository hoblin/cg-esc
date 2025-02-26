class PresentationsController < ApplicationController
  # Use the presentation layout
  layout "presentation"

  # GET /presentation
  def show
    @all_entries = current_user.contest.entries.includes(:country)
    @predictions = current_user.entry_ranking_place_predictions.includes(entry: :country)

    # Total number of possible positions - use either total entries or a fixed maximum (e.g., 37)
    @total_positions = @all_entries.count

    # Create a mapping of position numbers to entries
    @position_to_entry = {}
    @predictions.each do |prediction|
      @position_to_entry[prediction.predicted_place] = prediction.entry
    end
  end
end
