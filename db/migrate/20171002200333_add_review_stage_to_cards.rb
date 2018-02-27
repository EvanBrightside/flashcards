class AddReviewStageToCards < ActiveRecord::Migration[5.0]
  def self.up
    add_column :cards, :review_stage, :integer, default: 1
  end

  def self.down
    remove_column :cards, :review_stage
  end
end
