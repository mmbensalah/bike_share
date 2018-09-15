require 'rails_helper'

describe 'Conditions Dashboard' do
  describe 'user can visit conditions dashboard path' do
<<<<<<< HEAD
    it 'renders condition dashboard for user' do
=======
    xit 'renders condition dashboard for user' do
>>>>>>> f7a1b63643bb656fd6e28d4fcfe53ba7eb0a418c
      user = create(:user)

      visit conditions_dashboard_path

      expect(page).to have_content('Conditions Dashboard')
    end
<<<<<<< HEAD
    

    end

=======
>>>>>>> f7a1b63643bb656fd6e28d4fcfe53ba7eb0a418c
  end
end
