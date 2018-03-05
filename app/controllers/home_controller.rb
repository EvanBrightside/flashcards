# Initial controller for root page
class HomeController < ApplicationController
  def index
    if params[:deck_id].present?
      @card = current_user.decks.find(params[:deck_id]).cards.sample_card.sample
    else
      @card = current_user.cards.sample_card.sample
    end
    unless @card
      flash[:error] = t('cards.cards_done')
      redirect_to cards_path
    end
  end

  def perform
    @card = current_user.cards.find(params[:home][:id])
    compare = @card.check_translation(params[:home][:translated_text])
    if compare.zero?
      @card.new_review_date_and_stage
      flash[:message] = t('cards.correct_answer')
    elsif compare <= 2 && !compare.zero?
      @card.new_review_date_and_stage
      flash[:message] = t('cards.correct_is', correct: @card.translated_text,
                          incorrect: params[:home][:translated_text])
    else
      @card.set_try_count
      flash[:error] = t('cards.incorrect_answer')
    end
    redirect_back(fallback_location: root_path)
  end
end
