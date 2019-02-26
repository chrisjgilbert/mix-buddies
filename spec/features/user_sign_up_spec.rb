require 'rails_helper'

RSpec.feature 'user visits homepage', type: :feature do
  scenario 'user signs up' do
    user = FactoryBot.build(:user)
    visit 'users/sign_up'
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_on 'Sign Up'
    expect(current_path).to eq '/mixes'
    expect(page).to have_content "Hello, #{user.first_name}"
  end
end
