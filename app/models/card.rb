class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates :not_same_value, presence: true

  before_validation :revision_date, on: :create

  def not_same_value
    self.original_text.downcase != self.translated_text.downcase
  end

  private
    def revision_date
      self.review_date = Time.now + 3.days
    end
end
