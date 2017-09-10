class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :tattooshop_id
      t.string :purchase
      t.string :image
      t.string :title
      t.string :designer
      t.timestamps null: false
    end
  end
end
