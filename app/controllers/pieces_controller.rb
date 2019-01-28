class PiecesController < ApplicationController

  def index
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)

    if @piece.save
      redirect_to "/pieces/#{@piece.id}"
    else
      render action: 'new'
    end
  end

  def show
    @piece = Piece.find_by(id: params[:id])
  end

  private

  def piece_params
    params.require(:piece).permit(:name, :description, :img)
  end
end