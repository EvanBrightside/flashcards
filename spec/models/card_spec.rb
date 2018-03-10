require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has not same value' do
    card = FactoryBot.build(:card)

    expect(card.not_same_value).to be true
  end

  it 'has validation' do
    card = FactoryBot.build(:card, translated_text: 'прИвЕт')

    expect(card.not_same_value).to be true
  end
end
