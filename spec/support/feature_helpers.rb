module FeatureHelpers
  def visit_homepage_and_add_mix
    visit "/"
    click_link 'add mix'
    fill_in 'mix_name', with: 'my mix'
    fill_in 'mix_url', with: 'www.blah.com'
    click_button 'submit'
  end
end
