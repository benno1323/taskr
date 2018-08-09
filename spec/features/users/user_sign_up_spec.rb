require 'rails_helper'

RSpec.feature "Visitor Signs Up", type: :feature do
  let(:user) { build(:user) }

  context "with valid credentials" do
    scenario "visitor can create account" do
      visit root_path
      click_link("Sign Up")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: user.password)
        fill_in("Password confirmation", with: user.password_confirmation)
        click_button("Sign up")
      }.to change(User, :count).by(1)

      expect(current_path).to eq(tasks_path)
      expect(page).to have_content("You have signed up successfully.")
    end
  end

  context "with invalid credentials" do
    scenario "can´t sign up without email" do
      visit root_path
      click_link("Sign Up")

      expect {
        fill_in("Email", with: "")
        fill_in("Password", with: user.password)
        fill_in("Password confirmation", with: user.password_confirmation)
        click_button("Sign up")
      }.to change(User, :count).by(0)

      expect(page).to have_content("Email can't be blank")
    end

    scenario "can´t sign up without password" do
      visit root_path
      click_link("Sign Up")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: "")
        fill_in("Password confirmation", with: user.password_confirmation)
        click_button("Sign up")
      }.to change(User, :count).by(0)

      expect(page).to have_content("Password can't be blank")
    end

    scenario "can´t sign up without password confirmation" do
      visit root_path
      click_link("Sign Up")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: user.password)
        fill_in("Password confirmation", with: "")
        click_button("Sign up")
      }.to change(User, :count).by(0)

    expect(page).to have_content("Password confirmation doesn't match Password")
    end

    scenario "can´t sign up if password does not meet minimum number of characters" do
      visit root_path
      click_link("Sign Up")

      expect {
        fill_in("Email", with: user.email)
        fill_in("Password", with: "a" * 5)
        fill_in("Password confirmation", with: "a" * 5)
        click_button("Sign up")
      }.to change(User, :count).by(0)

      expect(page).to have_content("Password is too short")
    end
  end
end
