class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  swagger_controller :notes, "Notes Management"

  swagger_api :create do
   summary "To create user"
   notes "Implementation notes, such as required params, example queries for apis are written here."
   param :form, "note[description]", :string, :required, "Name of user"
   param :form, "note[status]", :string, :optional, "Age of user"
   response :success
   response :unprocessable_entity
 end

  # GET /api/v1/notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /api/v1/notes/1
  def show
    render json: @note
  end

  # POST /api/v1/notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:description,:status,:user_id)
    end
end