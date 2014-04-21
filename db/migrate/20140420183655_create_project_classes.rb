class CreateProjectClasses < ActiveRecord::Migration
  def change
    create_table :project_classes do |t|

      t.timestamps
    end
  end
end
