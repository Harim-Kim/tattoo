class CreateRereviews < ActiveRecord::Migration
  def change
    create_table :rereviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :review_id

      t.timestamps null: false
    end
  end
end
