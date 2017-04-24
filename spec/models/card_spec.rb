require 'rails_helper'

RSpec.describe Card, :type => :model do
  it 'has not same value' do
    card = FactoryGirl.build(:card)
    expect(card.not_same_value).to be true
  end

  it 'has validation' do
    card = FactoryGirl.build(:invalid_card)
    expect(card.not_same_value).to be false
  end

  it 'has correct check translation' do
    card = FactoryGirl.build(:card)
    text = FactoryGirl.attributes_for(:card)[:translated_text]
    expect(card.check_translation(text)).to be true
  end

  it 'is updated' do
    card = FactoryGirl.create(:card)
    card.card_update
    expect(card[:review_date].strftime('%d/%m/%Y')).to eq 3.days.from_now.strftime('%d/%m/%Y')
  end

  it 'set revision date' do
    card = FactoryGirl.create(:card)
    expect(card.send(:set_revision_date).strftime('%d/%m/%Y')).to eq Time.now.strftime('%d/%m/%Y')
  end
end
