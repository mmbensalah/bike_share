require 'rails_helper'

describe 'Conditions Dashboard' do
  describe 'user can visit conditions dashboard path' do
    it 'visits condition dashboard' do
      user = create(:user)

      visit '/conditions-dashboard'

      expect(page).to have_content('Conditions Dashboard')
    end

  end
end
