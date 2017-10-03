FactoryGirl.define do
  factory :card do
    original_text 'Привет'
    translated_text 'Hello'
    review_date Time.current
    review_stage 1
    try_count 0
  end
end
