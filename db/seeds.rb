require 'open-uri'

ru_url = 'http://1000mostcommonwords.com/1000-most-common-russian-words/'
ru_data = Nokogiri::HTML(open(ru_url))

it_url = 'http://1000mostcommonwords.com/1000-most-common-italian-words/'
it_data = Nokogiri::HTML(open(it_url))

User.create!(email: 'im@gmail.com', password: '1q2w3e4r', password_confirmation: '1q2w3e4r')
@ru_deck = Deck.create!(name: 'RU Deck', user_id: User.last.id)
@it_deck = Deck.create!(name: 'IT Deck', user_id: User.last.id)

100.times do |card|
  line_count = card + 2
  Card.create!(
    original_text: ru_data.xpath("//table//tbody/tr[#{line_count}]/td[2]").text,
    translated_text: ru_data.xpath("//tbody//tr[#{line_count}]/td[3]").text,
    review_date: Date.today,
    deck_id: @ru_deck.id,
    remote_image_url: 'https://picsum.photos/360/360?random',
    user_id: User.last.id
  )
end

100.times do |card|
  line_count = card + 2
  Card.create!(
    original_text: it_data.xpath("//table//tbody/tr[#{line_count}]/td[2]").text,
    translated_text: it_data.xpath("//tbody//tr[#{line_count}]/td[3]").text,
    review_date: Date.today,
    deck_id: @it_deck.id,
    remote_image_url: 'https://picsum.photos/360/360?random',
    user_id: User.last.id
  )
end
