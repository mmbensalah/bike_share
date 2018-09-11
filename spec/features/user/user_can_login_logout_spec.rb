require 'rails_helper'

describe 'As a user' do
  it 'user can login' do

    visit root_path

    click_on "Log In"
    user = create(:user)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within ".login-form" do
      click_on "Log In"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome #{user.username}")
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)

    within ".navbar" do
      expect(page).to have_content("Logged in as #{user.username}")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Log In")
      expect(page).to_not have_content("Create Account")
    end
  end
  it 'user can logout' do

    visit root_path

    click_on "Log In"
    user = create(:user)

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    within ".login-form" do
      click_on "Log In"
    end

    click_on "Log Out"

    expect(current_path).to eq root_path

    expect(page).to have_content("You have successfully logged out.")
    within ".navbar" do
      expect(page).to_not have_content("Logged in as #{user.username}")
      expect(page).to_not have_content("Log Out")
      expect(page).to have_content("Log In")
      expect(page).to have_content("Create Account")
    end
  end
end
