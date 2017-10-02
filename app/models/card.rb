class Card < ApplicationRecord
  validates :original_text, :translated_text, :deck_id, presence: true
  validates :not_same_value, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  belongs_to :deck

  scope :sample_card, -> { where('review_date <= ?', Time.current) }

  before_create :set_revision_date

  def not_same_value
    self.original_text.downcase != self.translated_text.downcase
  end

  def check_translation(text)
    self.translated_text == text
  end

  def new_review_date_and_stage
    newdate = {
      1 => Time.current + 12.hour,
      2 => Time.current + 3.days,
      3 => Time.current + 1.week,
      4 => Time.current + 2.weeks,
      5 => Time.current + 1.month
    }
    next_date = newdate[review_stage]
    next_stage = review_stage < 5 ? review_stage + 1 : 5
    self.update(review_date: next_date, review_stage: next_stage)
  end

  private
    def set_revision_date
      self.review_date = Time.current
    end
end
