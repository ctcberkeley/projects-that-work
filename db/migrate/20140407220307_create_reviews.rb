class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, :as_relation_superclass => true do |t|
      t.integer :overallScore
      t.integer :planningScore
      t.integer :implementationScore
      t.string :comment  
      t.timestamps
    end
  end
end
