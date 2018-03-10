require 'rails_helper'

RSpec.describe SuperMemo, type: :service do
  card = FactoryBot.build(:card, try_count: 1)

  context 'has correct review_stage value' do
    card_1 = FactoryBot.build(:card)

    it { expect(SuperMemo.new(card_1).review_stage).to eq(1) }
    it { expect(SuperMemo.new(card).review_stage).to eq(6) }
  end

  it 'returns minimum 1.3' do
    sm = SuperMemo.new(card)

    expect(sm.e_factor).to eq(1.3)
  end

  it 'has correct ef calculation' do
    card_2 = FactoryBot.build(:card, try_count: 5, ef: 1.5)
    sm = SuperMemo.new(card_2)

    expect(sm.e_factor).to eq(1.6)
  end

  it 'returs ef when count is 4' do
    card_3 = FactoryBot.build(:card, try_count: 4)
    sm = SuperMemo.new(card_3)

    expect(sm.e_factor).to eq(card_3.ef)
  end

  it 'set new review date == 6 days since' do
    sm = SuperMemo.new(card)

    expect(sm.new_review_date.to_s).to eq((Time.current + 6.days).to_s)
  end
end
