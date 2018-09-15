require "rails_helper"

describe "As an authenticated user" do
  describe "when I visit my account page" do
    it "should be able to edit account info" do
      old_first_name = "Jeniece"
      old_last_name = "Mona"
      old_email = "jm@email.com"
      old_address = "555 Super st, Denver, CO 80333"

      visit new_user_path

      fill_in :user_first_name, with: old_first_name
      fill_in :user_last_name, with: old_last_name
      fill_in :user_email, with: old_email
      fill_in :user_address, with: old_address
      fill_in :user_username, with: "userlady"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"
      click_on("Create User")

      visit dashboard_path

      click_on("Edit my account info")

      new_first_name = "Kat"
      new_last_name = "Yruegas"
      new_email = "katy@email.com"
      new_address = "123 Main St, Denver, CO 80224"

      expect(current_path).to eq(edit_user_path(User.last))
      fill_in :user_first_name, with: new_first_name
      fill_in :user_last_name, with: new_last_name
      fill_in :user_email, with: new_email
      fill_in :user_address, with: new_address

      click_on("Update Account")

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(new_first_name)
      expect(page).to have_content(new_last_name)
      expect(page).to have_content(new_email)
      expect(page).to have_content(new_address)
      expect(page).to_not have_content(old_first_name)
      expect(page).to_not have_content(old_last_name)
      expect(page).to_not have_content(old_email)
      expect(page).to_not have_content(old_address)
    end

    it 'user must be logged in to edit account' do
      user = create(:user)
      visit edit_user_path(user)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'should only allow user to edit their own account' do
      user = create(:user)
      other_user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit edit_user_path(other_user)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
