class CreateShoptattoolikes < ActiveRecord::Migration
  def change
    create_table :shoptattoolikes do |t|
      t.integer :user_id
      t.integer :shoptattooimg_id
      t.timestamps null: false
    end
  end
end
