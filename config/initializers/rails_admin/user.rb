if User.table_exists?
  RailsAdmin.config User do
    list do
      # simply adding fields by their names (order will be maintained)
      include_fields :full_name, :guardian, :id_no, :mobile_no, :address, :country, :email, :advisor, :member_code, :advisor_code, :nok, :nok_id, :nok_mobile, :bank, :bank_branch, :bank_ac, :password, :password_confirmation, :superadmin_role, :supervisor_role, :user_role
    end
  end
end
