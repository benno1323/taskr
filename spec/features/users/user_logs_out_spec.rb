require 'rails_helper'

RSpec.feature "Visitor Signs Out", type: :feature do
  context "as a logged in user" do
    scenario "user logs out" do
      user = build(:user)
      login_as(user, scope: :user)

      click_link("Sign Out")
      expect(page).to eq(root_path)
      expect(page).to have_content("See you soon")
    end
  end
end
