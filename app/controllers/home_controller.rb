# Initial controller for root page
class HomeController < ApplicationController
  def index
    @card = Card.sample_card.sample
    @card_origianl = @card.original_text
  end

  def perform
    if  params[:home][:translated_text] == Card.find(params[:home][:id]).translated_text
      Card.find(params[:home][:id]).update(review_date: Time.now + 3.days)
      flash[:message] = 'Yep!'
      redirect_to :back
    else
      flash[:error] = 'No!'
      redirect_to :back
    end
  end
end
