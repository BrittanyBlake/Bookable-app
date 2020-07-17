class ChangeUsername < ActiveRecord::Migration[5.2]
  def change 
    change_table :users do |t|
      t.change :username, :string, null: false, default: ""
    end
  end
end
