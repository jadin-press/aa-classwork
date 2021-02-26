class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(params.require(:artwork_share).permit(:artwork_id, :viewer_id))
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  def destroy
    share = ArtworkShare.find_by(id: params[:id])
    share.destroy
    render json: share
  end
    
end