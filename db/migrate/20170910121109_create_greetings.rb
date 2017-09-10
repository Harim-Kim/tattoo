class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.text :content
      t.integer :tattooshop_id
      t.string :openhour
      t.string :hourlyprice

      t.timestamps null: false
    end
  end
end
