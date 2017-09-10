class CreateShoplikes < ActiveRecord::Migration
  def change
    create_table :shoplikes do |t|
      t.integer :user_id
      t.integer :tattooshop_id
      t.timestamps null: false
    end
  end
end
