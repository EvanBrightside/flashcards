every 1.day, at: '4:30 am' do
  runner 'CardsMailer.pending_cards_notification'
end
