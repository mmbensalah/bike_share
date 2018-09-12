require 'rails_helper'

describe 'Conditions Dashboard' do
  describe 'user can visit conditions dashboard path' do
    it 'renders condition dashboard for user' do
      user = create(:user)

      visit conditions_dashboard_path

      expect(page).to have_content('Conditions Dashboard')
    end
  end
end
