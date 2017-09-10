class CreateFullmanages < ActiveRecord::Migration
  def change
    create_table :fullmanages do |t|
      t.integer :tattooshop_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
