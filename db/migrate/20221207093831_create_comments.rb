class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.string :movie_id
      t.string :integer

      t.timestamps
    end
  end
end
