FactoryGirl.define do
  factory :invalid_card, class: Card do
    original_text "Привет"
    translated_text  "привеТ"
    review_date Time.now
  end
end
