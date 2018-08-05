require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  pending "add some scenarios (or delete) #{__FILE__}"
  scenario "guest visits welcome page" do
    visit root_path
    expect(page).to have_content("Welcome!")
  end
end
