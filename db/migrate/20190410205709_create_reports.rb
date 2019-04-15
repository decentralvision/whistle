class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :content
      t.float :lat
      t.float :lng
      t.date :string
      t.timestamps null: false
    end
  end
end
