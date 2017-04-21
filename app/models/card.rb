class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :not_same_value, presence: true

  scope :sample_card, -> { where("review_date <= ?", Time.now) }

  before_create :set_revision_date

  def not_same_value
    self.original_text.downcase != self.translated_text.downcase
  end

  private
    def set_revision_date
      self.review_date = Time.now + 3.days
    end
end
