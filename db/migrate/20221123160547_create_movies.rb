class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :release_date
      t.text :about
      t.string :language
      t.string :country_of_origin
      t.integer :gross_worldwide
      t.string :runtime

      t.timestamps
    end
  end
end
