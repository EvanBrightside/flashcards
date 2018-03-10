class SuperMemo
  attr_reader :card

  def initialize(card)
    @card = card
    @ef = card.ef
    @try_count = card.try_count
  end

  def review_stage
    case @try_count
    when 0 then 1
    when 1 then 6
    else card.review_stage * @ef
    end
  end

  def new_review_date
    review_stage.days.from_now
  end

  def e_factor
    return @ef if @try_count == 4
    new_ef = @ef + (0.1 - (5 - @try_count) * (0.08 + (5 - @try_count) * 0.02))
    new_ef < 1.3 ? 1.3 : new_ef
  end
end
