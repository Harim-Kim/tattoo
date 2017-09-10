class CreateDesignlikes < ActiveRecord::Migration
  def change
    create_table :designlikes do |t|
      t.integer :user_id
      t.integer :shopdesignimg_id
      t.timestamps null: false
    end
  end
end
