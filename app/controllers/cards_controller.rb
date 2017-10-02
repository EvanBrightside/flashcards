# Controller for Cards page
class CardsController < ApplicationController
  def index
    @cards = current_user.cards.all
  end

  def show
    @card = current_user.cards.find(params[:id])
  end

  def new
    @card = Card.new
    @decks = current_user.decks
  end

  def edit
    @card = current_user.cards.find(params[:id])
  end

  def create
    @card = current_user.cards.create(card_params)
    if @card.save!
      render :show
    else
      render :new
    end
  end

  def update
    @card = current_user.cards.find(params[:id])
    if @card.update!(card_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @card = current_user.cards.find(params[:id])
    @card.destroy!

    redirect_to cards_path
  end

  private
    def card_params
      params.require(:card).permit(:deck_id, :original_text, :translated_text, :review_date, :review_stage, :image, :image_cache, :remote_image_url)
    end
end
