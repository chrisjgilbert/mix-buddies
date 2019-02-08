module FeatureHelpers
  def visit_homepage_and_add_mix_with_tags
    visit "/"
    click_link 'add mix'
    fill_in 'mix_name', with: 'my mix'
    fill_in 'mix_url', with: 'www.blah.com'
    fill_in 'mix_tag_list', with: 'techno, house'
    click_button 'submit'
  end
end
