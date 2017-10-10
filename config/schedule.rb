#set :output, 'log/whenever.log'

every 2.minutes do
  runner 'Card.pending_cards_notification'
end

# every 1.day, at: '5:30 am' do
#   runner 'Card.pending_cards_notification'
# end
