# Initial controller for root page
class HomeController < ApplicationController
  def index
    @card = Card.sample_card.sample
  end

  def perform
    @card = Card.find(params[:home][:id])
    if @card.check_translation(params[:home][:translated_text])
      @card.card_update
      flash[:message] = 'Yep!'
    else
      flash[:error] = 'No!'
    end
    redirect_back(fallback_location: root_path)
  end
end
