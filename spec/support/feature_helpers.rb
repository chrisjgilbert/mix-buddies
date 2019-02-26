# frozen_string_literal: true

module FeatureHelpers
  def visit_homepage_and_add_mix_with_techno_house_tags
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_link 'add mix'
    fill_in 'mix_name', with: 'my mix'
    fill_in 'mix_url', with: 'www.blah.com'
    fill_in 'mix_tag_list', with: 'techno, house'
    click_button 'submit'
  end

  def visit_homepage_and_add_mix_with_disco_tag
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit '/'
    click_link 'add mix'
    fill_in 'mix_name', with: 'disco mix'
    fill_in 'mix_url', with: 'www.disco.com'
    fill_in 'mix_tag_list', with: 'disco'
    click_button 'submit'
  end
end
