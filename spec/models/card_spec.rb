require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has not same value' do
    card = FactoryGirl.build(:card)
    expect(card.not_same_value).to be true
  end

  it 'has validation' do
    card = FactoryGirl.build(:card, translated_text: 'прИвЕт')
    expect(card.not_same_value).to be false
  end

  it 'has check translation' do
    card = FactoryGirl.build(:card)
    text = FactoryGirl.attributes_for(:card)[:translated_text]
    expect(card.check_translation(text)).to be true
  end

  it 'false with incorrect translated text' do
    card = FactoryGirl.build(:card)
    text = FactoryGirl.attributes_for(:card, translated_text: 'Hella')[:translated_text]
    expect(card.check_translation(text)).to be false
  end

  it 'review date is updated' do
    card = FactoryGirl.create(:card)
    card.new_review_date
    expect(card[:review_date]).to eq(Date.today + 3.days)
  end
end
