class CheckAnswer
  attr_reader :card, :answer, :message

  def initialize(card, answer)
    @card   = card
    @answer = answer
    @translate = @card.translated_text
  end

  def check
    if correct?
      correct_answer
      I18n.t('cards.correct_answer')
    elsif typo?
      I18n.t('cards.correct_is', correct: @translate, incorrect: @answer)
    else
      incorrect_answer
      I18n.t('cards.incorrect_answer')
    end
  end

  private

  def correct_answer
    @card.try_count += 1
    @card.try_count = 5 if @card.try_count > 5
    new_review_stage
    @card.save!
  end

  def incorrect_answer
    @card.try_count = 0
    new_review_stage
    @card.save!
  end

  def correct?
    @translate.downcase == @answer.downcase
    # @translate.casecmp?(@answer)
  end

  def typo?
    DamerauLevenshtein.distance(@translate.downcase, @answer.downcase) <= 2
  end

  def new_review_stage
    sm = SuperMemo.new(@card)
    @card.ef = sm.e_factor
    @card.review_stage = sm.review_stage
    @card.review_date = sm.new_review_date
  end
end
