require "rails_helper"

RSpec.describe CardsMailer, type: :mailer do
  user = FactoryGirl.build(:user)
  mail = FactoryGirl.build(:mail)

  it 'renders the subject' do
    expect(mail.subject).to eq('You have a new cards!')
  end

  it 'renders the receiver email' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eq(['xvanx84@gmail.com'])
  end
end
