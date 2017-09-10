class CreateShoptattoocomments < ActiveRecord::Migration
  def change
    create_table :shoptattoocomments do |t|
      t.text :content
      t.integer :user_id
      t.integer :shoptattooimg_id

      t.timestamps null: false
    end
  end
end
