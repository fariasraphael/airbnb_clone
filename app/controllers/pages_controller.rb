class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @offers = Offer.all
  end

  def my_offers
    @user = current_user
    @offers = Offer.where(user_id: @user)
  end

end
