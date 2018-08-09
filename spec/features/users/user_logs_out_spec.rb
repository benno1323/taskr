require 'rails_helper'

RSpec.feature "Visitor Signs Out", type: :feature do
  context "as a logged in user" do
    scenario "user logs out" do
      user = build(:user)
      login_as(user, scope: :user)

      visit tasks_path
      click_link("Log Out")
      expect(current_path).to eq(root_path)
    end
  end
end
