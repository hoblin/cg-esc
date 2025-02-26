class EntriesController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    @entries = current_user.contest.entries.includes(:country)
    @predictions = current_user.entry_ranking_place_predictions.index_by(&:entry_id)
  end

  # GET /entries/1 or /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy!

    respond_to do |format|
      format.html { redirect_to entries_path, status: :see_other, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /entries/:id/predict
  def predict
    @entry = Entry.find(params[:id])
    prediction = current_user.entry_ranking_place_predictions.find_or_initialize_by(entry: @entry)
    prediction.predicted_place = params[:predicted_place]
    prediction.notes = params[:notes] if params[:notes].present?

    respond_to do |format|
      if prediction.save
        format.html { redirect_to entries_path, notice: "Prediction saved." }
        format.json { render json: { success: true } }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@entry), partial: "entries/entry", locals: { entry: @entry, prediction: prediction }) }
      else
        format.html { redirect_to entries_path, alert: "Failed to save prediction: #{prediction.errors.full_messages.join(', ')}" }
        format.json { render json: { success: false, errors: prediction.errors.full_messages } }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@entry), partial: "entries/entry", locals: { entry: @entry, prediction: prediction }) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:contest_id, :country_id, :artist_name, :song_title, :lyrics, :en_lyrics, :semifinal, :semifinal_order, :final_order, :qualified)
    end
end
