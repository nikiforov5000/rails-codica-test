class ChangeOpenInAppointment < ActiveRecord::Migration[6.1]
  def change
    change_column :appointments, :open, :boolean, default:true
  end
end
