class Card < ApplicationRecord
  validates :original_text, :translated_text, :deck_id, presence: true
  validates :not_same_value, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :deck

  scope :sample_card, -> { where('review_date <= ?', Time.current) }

  before_create :set_revision_date

  def not_same_value
    !original_text.casecmp(translated_text).zero?
  end

  def self.pending_cards_notification
    sample_card.pluck('DISTINCT user_id').each do |user_id|
      CardsMailer.pending_cards(user_id).deliver_later
    end
  end

  private

  def set_revision_date
    self.review_date = Time.current
  end
end
