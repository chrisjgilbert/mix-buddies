require 'rails_helper'
include FeatureHelpers

RSpec.feature "user visits homepage", type: :feature do
  scenario "user searches by tag" do
    visit_homepage_and_add_mix_with_tags
    click_link 'techno'
    expect(page).to have_selector(:css, 'a[href="https://www.blah.com"]')
    expect(page).to have_link "techno"
    expect(page).to have_link "house"
  end
end
