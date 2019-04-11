class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :report_id
      t.string :content
      t.timestamps null: false
    end
  end
end
