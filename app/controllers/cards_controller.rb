# Controller for Cards page
class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
end
