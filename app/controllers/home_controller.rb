# Initial controller for root page
class HomeController < ApplicationController
  def index
    if params[:deck_id].present?
      @card = current_user.decks.find(params[:deck_id]).cards.sample_card.sample
    else
      @card = current_user.cards.sample_card.sample
    end
    unless @card
      flash[:error] = 'All cards done! Please choose another DECK!!!'
      redirect_to cards_path
    end
  end

  def perform
    @card = current_user.cards.find(params[:home][:id])
    if @card.check_translation(params[:home][:translated_text])
      @card.new_review_date_and_stage
      flash[:message] = 'Correct answer!'
    else
      @card.set_try_count
      flash[:error] = 'Incorrect answer.'
    end
    redirect_back(fallback_location: root_path)
  end
end

