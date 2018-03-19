# Initial controller for root page
class Dashboard::HomeController < ApplicationController
  def index
    if params[:deck_id].present?
      @card = current_user.decks.find(params[:deck_id]).cards.sample_card.sample
    else
      @card = current_user.cards.sample_card.sample
    end
    respond_to do |format|
      format.html
      format.js { flash[:message] }
    end
    return if  @card
    redirect_to cards_path
    flash[:error] = t('cards.cards_done')
  end

  def perform
    @card = current_user.cards.find(params[:home][:id])
    answer = params[:home][:translated_text]
    message = CheckAnswer.new(@card, answer).check
    flash[:message] = message

    redirect_to home_index_path
  end
end
