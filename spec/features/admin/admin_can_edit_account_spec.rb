require 'rails_helper'

describe 'As an admin' do
  describe 'can edit account' do
    it 'updates account info' do
      admin = create(:user, role: 1)

      visit login_path

      fill_in :username, with: admin.username
      fill_in :password, with: admin.password

      within "#logging_in" do
        click_on("Log In")
      end

      click_on("Edit my account info")

      name_2 = "Roberto"
      last_name_2 = "Sing"
      email_2 = "rsing@email.com"
      address_2 = "444 River St, Denver, CO 80222"

      fill_in :user_first_name, with: name_2
      fill_in :user_last_name, with: last_name_2
      fill_in :user_email, with: email_2
      fill_in :user_address, with: address_2

      click_on("Update Account")

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content(name_2)
      expect(page).to have_content(last_name_2)
      expect(page).to have_content(email_2)
      expect(page).to have_content(address_2)
    end
    it 'should only allow admin to edit their own account' do
      admin = create(:user, role: 1)
      other_user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_user_path(other_user)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
