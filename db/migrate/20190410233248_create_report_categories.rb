class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.integer :report_id
      t.string :category_id
      t.timestamps null: false
    end
  end
end
