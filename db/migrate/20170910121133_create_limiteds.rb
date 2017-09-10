class CreateLimiteds < ActiveRecord::Migration
  def change
    create_table :limiteds do |t|
      t.integer :tattooshop_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
