require 'rails_helper'

RSpec.feature 'user sign out', type: :feature do
  scenario 'user can sign out if signed in' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit '/mixes'
    expect(page).to have_content "Hello, #{user.first_name}"
    click_on 'Sign Out'
    expect(page).not_to have_content 'Sign Out'
    expect(page).not_to have_content "Hello, #{user.first_name}"
    expect(current_path).to eq '/'
    expect(page).to have_content 'Sign In'
  end
end
