# Decks Controller
class Dashboard::DecksController < ApplicationController
  def index
    @decks = current_user.decks.all
  end

  def show
    @deck = current_user.decks.find(params[:id])
  end

  def new
    @deck = current_user.decks.build
  end

  def create
    @deck = current_user.decks.create(deck_params)
    if @deck.save!
      render :show
    else
      render :new
    end
  end

  def destroy
    @deck = current_user.decks.find(params[:id])
    @deck.destroy!

    redirect_to decks_path
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
