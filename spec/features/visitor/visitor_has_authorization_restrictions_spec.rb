require 'rails_helper'

describe 'visitor has authorization restrictions' do
  describe 'when they visit a restricted page' do
    it 'gives a 404 error' do
      visit dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to_not have_content("Welcome")

      visit admin_dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to_not have_content("Welcome")

      order = create(:order)
      visit order_path(order)
      expect(page).to have_content("The page you were looking for doesn't exist.")

      visit carts_path
      click_on "Checkout"
      expect(current_path).to eq(login_path)
      visit edit_user_path(order.user)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
