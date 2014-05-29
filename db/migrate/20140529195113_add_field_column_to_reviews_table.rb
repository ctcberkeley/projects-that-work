class AddFieldColumnToReviewsTable < ActiveRecord::Migration
  def change
  	add_column :reviews, :field, :hstore
  end
end
