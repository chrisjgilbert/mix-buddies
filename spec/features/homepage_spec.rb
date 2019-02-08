require 'rails_helper'
RSpec.feature "user visits homepage", type: :feature do
  scenario "smoke test" do
    visit "/"
    expect(page).to have_content "hello, world"
  end
end
