class CreateShopshopimgs < ActiveRecord::Migration
  def change
    create_table :shopshopimgs do |t|
      t.integer :tattooshop_id
      t.string :image
      t.string :title
      t.timestamps null: false
    end
  end
end
