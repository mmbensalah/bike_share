require 'rails_helper'

describe 'admin visits a conditions show page' do
  describe 'sees everything a user can see' do
    it 'can also see a button to edit a condition' do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      condition = create(:condition)

      visit condition_path(condition)
      expect(page).to have_content("Edit")

      click_on "Edit"

      expect(current_path).to eq edit_admin_condition_path(condition)
    end
    it 'can also see a button to delete a condition' do
      admin = create(:user, role:1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      condition = create(:condition)

      visit condition_path(condition)

      click_on "Delete"
      expect(current_path).to eq(conditions_path)
      expect(Condition.all.count).to eq(0)
    end
  end
  describe 'as a user' do
    it 'does not allow user to see edit or delete button on conditions show page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      condition = create(:condition)

      visit condition_path(condition)
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")

    end
  end
end
