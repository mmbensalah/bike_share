require "rails_helper"

describe "As a visitor" do
  describe "from landing page" do
    it 'can create an account' do
      first_name = "Bob"
      last_name = "Myers"
      email = "bobby@email.com"
      username = "newbikeman"
      password = "test"
      password_confirmation = "test"

      visit root_path
      click_on("Create Account")

      expect(current_path).to eq(new_user_path)
      fill_in :user_first_name, with: first_name
      fill_in :user_last_name, with: last_name
      fill_in :user_email, with: email
      fill_in :user_username, with: username
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      within(".login-form") do
        click_on("Create Account")
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome #{username}!")
    end
  end
end
