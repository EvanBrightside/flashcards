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
      1 => 12.hour,
      2 => 3.days,
      3 => 1.week,
      4 => 2.weeks,
      5 => 1.month
    }
    next_date = Time.current + newdate[review_stage]
    next_stage = review_stage < 5 ? review_stage + 1 : 5
    update(review_date: next_date, review_stage: next_stage, try_count: 0)
  end

  def set_try_count
    count = self[:try_count]
    if count <= 1
      update(try_count: count + 1)
    else
      update(review_date: Time.current + 12.hour, review_stage: 2, try_count: 0)
    end
  end

  private
    def set_revision_date
      self.review_date = Time.current
    end
end
