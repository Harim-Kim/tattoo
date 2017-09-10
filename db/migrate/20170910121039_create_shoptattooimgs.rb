class CreateShoptattooimgs < ActiveRecord::Migration
  def change
    create_table :shoptattooimgs do |t|
      t.integer :tattooshop_id
      t.string :image
      t.string :title
      t.text :description
      t.string :designer
      t.timestamps null: false
    end
  end
end
