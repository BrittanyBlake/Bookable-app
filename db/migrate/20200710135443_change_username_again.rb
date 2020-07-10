class ChangeUsernameAgain < ActiveRecord::Migration[5.2]
  def change 
    change_table :users do |t|
      t.change :username, :string
    end
  end
end
