# Mailer for Notificaions about new cards
class CardsMailer < ApplicationMailer
  def pending_cards(user_id)
    @user = User.find user_id

    mail(from: ENV['ADMIN_EMAIL'], to: @user.email, subject: 'You have a new cards!')
  end
end
