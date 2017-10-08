class AddReviewStageToCards < ActiveRecord::Migration[5.0]
  def self.up
    add_column :cards, :review_stage, :integer, default: 1
    remove_column :cards, :picture
  end

  def self.down
    add_column :cards, :picture, :string
    remove_column :cards, :review_stage
  end
end
