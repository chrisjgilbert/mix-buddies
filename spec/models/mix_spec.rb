# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mix, type: :model do
  describe 'creation validation' do
    it 'will create with valid attributes' do
      user = User.create(first_name: 'chris', last_name: 'gilbert', email: 'chris@gilbert.com', password: 'secret', password_confirmation: 'secret')
      mix = Mix.create(name: 'techno mix', url: 'www.google.com', tag_list: 'techno', user_id: user.id)
      expect(mix).to be_valid
    end

    it 'will not create without valid attributes' do
      mix = Mix.create(name: nil, url: nil, tag_list: nil, user_id: nil)
      expect(mix).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      should belong_to(:user)
    end
  end
end
