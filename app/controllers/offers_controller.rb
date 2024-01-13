class OffersController < ApplicationController
  def new
    @offer = Offer.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.new(offer_params)
    @offer.user = @user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :address, :price, :number_of_gests)
  end
end
