module UserHelper

  def sign_in_user(user)
    visit root_path

      fill_in 'email', with: (user.email)
      fill_in 'password', with: (user.password)

      click_button "Login"
  end
end

