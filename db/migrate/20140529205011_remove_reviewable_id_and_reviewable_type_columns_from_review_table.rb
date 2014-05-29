class RemoveReviewableIdAndReviewableTypeColumnsFromReviewTable < ActiveRecord::Migration
  def change
  	remove_column :reviews, :reviewable_id
  	remove_column :reviews, :reviewable_type
  end
end
