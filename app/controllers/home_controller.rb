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
    compare = @card.check_translation(params[:home][:translated_text])
    if compare == 0
      @card.new_review_date_and_stage
      flash[:message] = 'Correct answer!'
    elsif compare <= 2 && compare != 0
      @card.new_review_date_and_stage
      flash[:message] = "The correct answer is #{@card.translated_text}, you made a typo, your answer was #{params[:home][:translated_text]}."
    else
      @card.set_try_count
      flash[:error] = 'Incorrect answer.'
    end
    redirect_back(fallback_location: root_path)
  end
end
