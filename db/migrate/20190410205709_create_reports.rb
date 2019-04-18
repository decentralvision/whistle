class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :suspect_desc
      t.string :event_desc
      t.float :lat
      t.float :lng
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
