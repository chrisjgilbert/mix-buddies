require 'rails_helper'
include FeatureHelpers

RSpec.feature "user visits homepage", type: :feature do
  scenario "user deletes a mix" do 
    visit_homepage_and_add_mix_with_tags
    expect(page).to have_content "my mix"
    expect(page).to have_selector(:css, 'a[href="https://www.blah.com"]')
    click_link 'delete'
    expect(page).not_to have_content "my mix"
    expect(page).not_to have_selector(:css, 'a[href="https://www.blah.com"]')
  end
end
