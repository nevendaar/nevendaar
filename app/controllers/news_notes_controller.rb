class NewsNotesController < ApplicationController
  before_action :set_news_note, only: [:show, :edit, :update, :destroy]

  # GET /news_notes
  # GET /news_notes.json
  def index
    @news_notes = NewsNote.all
  end

  # GET /news_notes/1
  # GET /news_notes/1.json
  def show
  end

  # GET /news_notes/new
  def new
    @news_note = NewsNote.new
  end

  # GET /news_notes/1/edit
  def edit
  end

  # POST /news_notes
  # POST /news_notes.json
  def create
    @news_note = NewsNote.new(news_note_params)
    @news_note.user = current_user

    respond_to do |format|
      if @news_note.save
        format.html { redirect_to @news_note, notice: 'News note was successfully created.' }
        format.json { render :show, status: :created, location: @news_note }
      else
        format.html { render :new }
        format.json { render json: @news_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_notes/1
  # PATCH/PUT /news_notes/1.json
  def update
    respond_to do |format|
      if @news_note.update(news_note_params)
        format.html { redirect_to @news_note, notice: 'News note was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_note }
      else
        format.html { render :edit }
        format.json { render json: @news_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_notes/1
  # DELETE /news_notes/1.json
  def destroy
    @news_note.destroy
    respond_to do |format|
      format.html { redirect_to news_notes_url, notice: 'News note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_news_note
    @news_note = NewsNote.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def news_note_params
    params.require(:news_note).permit(:title, :brief, :text)
  end
end
