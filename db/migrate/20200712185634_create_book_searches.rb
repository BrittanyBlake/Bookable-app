class CreateBookSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :book_searches do |t|
      t.string :isbn
      t.string :title
      t.string :genre
      t.decimal :rating

      t.timestamps
    end
  end
end
