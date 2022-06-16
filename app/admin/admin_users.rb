ActiveAdmin.register AdminUser do
  permit_params :phone_no, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :phone_no
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :phone_no
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :phone_no
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
