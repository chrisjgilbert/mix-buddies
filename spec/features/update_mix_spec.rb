require 'rails_helper'
include FeatureHelpers

RSpec.feature "user visits homepage", type: :feature do
  scenario "user updates mix" do
    visit_homepage_and_add_mix_with_techno_house_tags
    click_link 'update'
    fill_in 'mix_name', with: 'updated mix'
    fill_in 'mix_url', with: 'www.updatedmix.com'
    fill_in 'mix_tag_list', with: 'hip-hop, disco'
    click_button 'submit'
    expect(page).not_to have_content "my mix"
    expect(page).not_to have_selector(:css, 'a[href="http://www.blah.com"]')
    expect(page).not_to have_link "techno"
    expect(page).not_to have_link "house"
    expect(page).to have_content "updated mix"
    expect(page).to have_selector(:css, 'a[href="http://www.updatedmix.com"]')
    expect(page).to have_link "hip-hop"
    expect(page).to have_link "disco"
  end
end
