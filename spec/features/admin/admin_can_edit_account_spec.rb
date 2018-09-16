require 'rails_helper'

describe 'As an admin' do
  describe 'can edit account' do
    it 'updates account info' do
      user = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      name = 'Robert'
      last_name = 'King'
      email = 'king@email.com'
      address = '555 Lake St, Denver, CO 80222'

      visit new_user_path

      fill_in :name, with: name
      fill_in :last_name, with: last_name
      fill_in :email, with: email
      fill_in :name, with: name
    end
  end
end
