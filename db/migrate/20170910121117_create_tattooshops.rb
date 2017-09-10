class CreateTattooshops < ActiveRecord::Migration
  def change
    create_table :tattooshops do |t|
      t.string :owner
      t.string :country
      t.string :city
      t.string :address
      t.string :shopname
      t.integer :phonenumber
      t.integer :user_id
      t.string :profile_img
      t.string :suburb
      t.float :longitude
      t.float :latitude
      t.timestamps null: false
    end
  end
end
