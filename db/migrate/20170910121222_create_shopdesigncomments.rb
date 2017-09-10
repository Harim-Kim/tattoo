class CreateShopdesigncomments < ActiveRecord::Migration
  def change
    create_table :shopdesigncomments do |t|
      t.text :content
      t.integer :user_id
      t.integer :shopdesignimg_id
      t.timestamps null: false
    end
  end
end
