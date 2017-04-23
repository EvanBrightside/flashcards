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
      redirect_to :back
    else
      flash[:error] = 'No!'
      redirect_to :back
    end
  end
end
