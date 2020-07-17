class CreateBookGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :book_groups do |t|
      t.references :book, foreign_key: true
      t.references :group, foreign_key: true
      

      t.timestamps
    end
  end
end
