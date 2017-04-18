require 'open-uri'

doc = Nokogiri::HTML(open('http://1000mostcommonwords.com/1000-most-common-russian-words/'))

cards_list = doc.xpath('.//tbody/tr[position() > 1]').map { |a|
  [a.xpath('td[position() = 2]').text, a.xpath('td[position() = 3]').text]
}

cards_list.each do |original, translate|
  Card.create( original_text: original, translated_text: translate )
end
