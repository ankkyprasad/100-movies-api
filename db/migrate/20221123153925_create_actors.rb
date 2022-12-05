class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :date_of_birth
      t.string :gender
      t.text :about
      t.integer :user_id

      t.timestamps
    end
  end
end
