require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has not same value' do
    card = FactoryGirl.build(:card)

    expect(card.not_same_value).to be true
  end

  it 'has validation' do
    card = FactoryGirl.build(:card, translated_text: 'прИвЕт')

    expect(card.not_same_value).to be true
  end

  it 'has check translation' do
    card = FactoryGirl.build(:card)
    text = FactoryGirl.attributes_for(:card)[:translated_text]

    expect(card.check_translation(text)).to be 0
  end

  it 'false with incorrect translated text' do
    card = FactoryGirl.build(:card)
    text = FactoryGirl.attributes_for(:card, translated_text: 'Hella')[:translated_text]

    expect(card.check_translation(text)).to be 1
  end

  it 'review date and stage is updated' do
    card = FactoryGirl.build(:card)
    card.new_review_date_and_stage

    expect(card[:review_date].to_s).to eq((Time.current + 12.hours).to_s)
    expect(card[:review_stage]).to eq(2)
    expect(card[:try_count]).to eq(0)
  end

  it 'update review date and stage by leitner system' do
    card = FactoryGirl.build(:card, review_stage: 3, try_count: 2)
    card.new_review_date_and_stage

    expect(card[:review_date].to_s).to eq((Time.current + 1.week).to_s)
    expect(card[:review_stage]).to eq(4)
    expect(card[:try_count]).to eq(0)
  end

  it 'update review date and stage by leitner system with review_stage == 5' do
    card = FactoryGirl.build(:card, review_stage: 5, try_count: 1)
    card.new_review_date_and_stage

    expect(card[:review_date].to_s).to eq((Time.current + 1.month).to_s)
    expect(card[:review_stage]).to eq(5)
    expect(card[:try_count]).to eq(0)
  end

  it 'set current try count' do
    card = FactoryGirl.build(:card)
    card.set_try_count

    expect(card[:try_count]).to eq(1)
  end

  it 'set new review date == 12 hours since' do
    card = FactoryGirl.build(:card, try_count: 2)
    card.set_try_count

    expect(card[:review_date].to_s).to eq((Time.current + 12.hours).to_s)
    expect(card[:review_stage]).to eq(2)
    expect(card[:try_count]).to eq(0)
  end
end
