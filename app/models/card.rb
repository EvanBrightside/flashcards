class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :not_same_value, presence: true

  belongs_to :user

  scope :sample_card, -> { where('review_date <= ?', Date.today) }

  before_create :set_revision_date

  def not_same_value
    self.original_text.downcase != self.translated_text.downcase
  end

  def check_translation(text)
    self.translated_text == text
  end

  def new_review_date
    self.update(review_date: Date.today + 3.days)
  end

  private
    def set_revision_date
      self.review_date = Date.today
    end
end
