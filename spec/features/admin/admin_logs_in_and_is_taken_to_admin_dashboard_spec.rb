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
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.email)
    end
  end
end
