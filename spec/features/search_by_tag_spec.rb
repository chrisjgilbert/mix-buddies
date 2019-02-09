require 'rails_helper'
include FeatureHelpers

RSpec.feature "user visits homepage", type: :feature do
  scenario "user searches by tag" do
    visit_homepage_and_add_mix_with_techno_house_tags
    click_link 'techno'
    expect(page).to have_selector(:css, 'a[href="http://www.blah.com"][target="_blank"]')
    expect(page).to have_link "techno"
    expect(page).to have_link "house"
  end

  scenario "user searches by tag and then views all mixes" do
    visit_homepage_and_add_mix_with_techno_house_tags
    visit_homepage_and_add_mix_with_disco_tag
    click_link 'techno'
    expect(page).to have_selector(:css, 'a[href="http://www.blah.com"][target="_blank"]')
    expect(page).to have_content "my mix"
    expect(page).to have_link "techno"
    expect(page).not_to have_content "disco mix"
    expect(page).not_to have_selector(:css, 'a[href="http://www.disco.com"][target="_blank"]')
    expect(page).not_to have_link "disco"
    click_link 'view all'
    expect(page).to have_content "disco mix"
    expect(page).to have_content "my mix"
    expect(page).to have_link "techno"
    expect(page).to have_link "disco"
    expect(page).to have_selector(:css, 'a[href="http://www.disco.com"][target="_blank"]')
    expect(page).to have_selector(:css, 'a[href="http://www.blah.com"][target="_blank"]')
    expect(page).to have_content "my mix"
  end
end
