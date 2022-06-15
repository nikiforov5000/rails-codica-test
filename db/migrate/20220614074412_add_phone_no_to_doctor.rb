class AddPhoneNoToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :phone_no, :string
  end
end
