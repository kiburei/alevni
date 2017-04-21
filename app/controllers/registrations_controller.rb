class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      UserMailer.user_email(@user).deliver
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:full_name, :guardian, :country, :mobile_no, :member_code, :id_no, :advisor, :advisor_code, :nok, :nok_id, :nok_mobile, :address, :bank, :bank_branch, :bank_ac, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:mobile_no, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end
