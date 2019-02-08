require 'rails_helper'
include FeatureHelpers

RSpec.feature "user visits homepage", type: :feature do
  scenario "user adds a mix" do 
    visit_homepage_and_add_mix
    expect(page).to have_content "my mix"
    expect(page).to have_selector(:css, 'a[href="https://www.blah.com"]')
  end
end
