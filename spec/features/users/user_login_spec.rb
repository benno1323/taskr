require 'rails_helper'

RSpec.feature "Visitor logs in", type: :feature do
  let(:user) { create(:user) }
  context "with valid credentials" do
    scenario "visitor can sign in" do
      visit root_path
      click_link("Log In")

      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)
      click_button("Log in")

      expect(current_path).to eq(tasks_path)
      expect(page).to have_content("Signed in successfully.")
    end
  end

  context "with invalid credentials" do
    scenario "can´t log in without email" do
      visit root_path
      click_link("Log In")

      fill_in("Email", with: '')
      fill_in("Password", with: user.password)
      click_button("Log in")

      expect(current_path).to eq(new_user_session_path)
      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "can´t log in without password" do
      visit root_path
      click_link("Log In")

      fill_in("Email", with: user.email)
      fill_in("Password", with: '')
      click_button("Log in")

      expect(current_path).to eq(new_user_session_path)
      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
