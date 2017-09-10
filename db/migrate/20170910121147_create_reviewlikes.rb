class CreateReviewlikes < ActiveRecord::Migration
  def change
    create_table :reviewlikes do |t|
      t.integer :user_id
      t.integer :review_id
      t.timestamps null: false
    end
  end
end
