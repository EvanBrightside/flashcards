# file: config/schedule.rb

set :output, 'log/whenever.log'

every 1.day, at: '1:30 am' do
  runner 'Card.pending_cards_notification'
end
