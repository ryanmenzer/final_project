require 'support/user_helper'

module UserHelper

  def sign_in_user(user)
    visit '/'
      click_link "Sign in here"
      fill_in "email", with: user.email
      fill_in "password", with: user.password

      click_button "Login"
  end
end

