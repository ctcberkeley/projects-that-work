class AddProjectReferencesToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :project, index: true
  end
end
