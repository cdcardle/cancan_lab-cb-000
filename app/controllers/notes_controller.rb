class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :new, :show, :update]

  def index
    if current_user
      @notes = User.readable
    else 
      @notes = Note.none
    end
  end
  
  def new
    @note = Note.new
  end
  
  def create
    if current_user
      note = Note.new(note_params)
      note.user = current_user
      note.save!
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
