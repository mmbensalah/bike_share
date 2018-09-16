require 'rails_helper'

describe 'visitor has authorization restrictions' do
  describe 'when they visit a restricted page' do
<<<<<<< HEAD
    it 'gives a 404 error' do
=======
    xit 'gives a 404 error' do
>>>>>>> 160dc1489bd457edd39477490c7290b8eda89dd8
      visit dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to_not have_content("Welcome")

      visit admin_dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to_not have_content("Welcome")

      # add this once orders are built out
      # create(:order) # through a user
      # visit order_path(order)
      # expect(page).to have_content("The page you were looking for doesn't exist.")

    end
  end
end
