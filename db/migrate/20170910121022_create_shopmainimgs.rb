class CreateShopmainimgs < ActiveRecord::Migration
  def change
    create_table :shopmainimgs do |t|
      t.integer :tattooshop_id
      t.string :image

      t.timestamps null: false
    end
  end
end
