class CreateShopdesignimgs < ActiveRecord::Migration
  def change
    create_table :shopdesignimgs do |t|
      t.integer :tattooshop_id
      t.string :image
      t.string :designer
      t.string :timespan
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
