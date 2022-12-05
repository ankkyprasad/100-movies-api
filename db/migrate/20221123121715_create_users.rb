class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :name
      t.integer :role, default: 0

      t.timestamps
    end
  end
end