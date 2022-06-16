class AddPhoneNoToAdminUser < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :phone_no, :string
  end
end
