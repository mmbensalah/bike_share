require 'rails_helper'

describe 'admin goes to log in form' do
  describe 'fills out their credentials' do
    it 'takes them to /admin/dashboard' do
      admin = create(:user, role: 1)

      visit login_path

      fill_in :username, with: admin.username
      fill_in :password, with: admin.password

      within ".login-form" do
        click_on "Log In"
      end

      expect(current_path).to eq(admin_dashboard_path)

      expect(page).to have_content("Welcome #{admin.username}")
      expect(page).to have_content("Logged in as Admin User: #{admin.username}",)
      expect(page).to have_content(admin.first_name)
      expect(page).to have_content(admin.last_name)
      expect(page).to have_content(admin.email)
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
    end

    it 'should have admin dashboard in nav' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit dashboard_path

      click_on("Admin Dashboard")
      expect(current_path).to eq(admin_dashboard_path)
    end

    it 'should not allow a user to see Admin Dashboard' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path
      expect(page).to_not have_content("Admin Dashboard")

      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'should have link to admin/bike-shop' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on("View all Items in Bike Shop")
      expect(current_path).to eq(admin_bike_shop_path)
    end
  end
end
