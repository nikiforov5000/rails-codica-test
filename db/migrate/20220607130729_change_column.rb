class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :appointments, :done, :boolean, default:false
  end
end
