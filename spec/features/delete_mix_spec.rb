# frozen_string_literal: true

require 'rails_helper'
include FeatureHelpers

RSpec.feature 'user visits homepage', type: :feature do
  scenario 'user deletes a mix' do
    visit_homepage_and_add_mix_with_techno_house_tags
    expect(page).to have_content 'my mix'
    expect(page).to have_selector(:css, 'a[href="http://www.blah.com"][target="_blank"]')
    click_link 'delete'
    expect(page).not_to have_content 'my mix'
    expect(page).not_to have_selector(:css, 'a[href="http://www.blah.com"][target="_blank"]')
  end
end
