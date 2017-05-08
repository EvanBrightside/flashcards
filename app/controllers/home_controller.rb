# Initial controller for root page
class HomeController < ApplicationController
  def index
    @card = current_user.cards.sample_card.sample
    unless @card
      flash[:error] = 'All cards done!'
      redirect_to cards_path
    end
  end

  def perform
    @card = current_user.cards.find(params[:home][:id])
    if @card.check_translation(params[:home][:translated_text])
      @card.new_review_date
      flash[:message] = 'Yep!'
    else
      flash[:error] = 'No!'
    end
    redirect_back(fallback_location: root_path)
  end
end
