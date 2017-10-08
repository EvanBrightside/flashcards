class CardsMailer < ApplicationMailer
  def pending_cards_notification
    User.find(Card.where('review_date <= ? ', Time.current).pluck(:user_id).uniq).each do |user|
	    mail(from: ENV['ADMIN_EMAIL'], to: user.email, subject: 'You have a new cards!')
	  end
  end
end
