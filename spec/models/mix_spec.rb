# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mix, type: :model do
  describe 'creation validation' do
    it 'will create with valid attributes' do
      mix = Mix.create(name: 'techno mix', url: 'www.google.com', tag_list: 'techno')
      expect(mix).to be_valid
    end

    it 'will not create without valid attributes' do
      mix = Mix.create(name: '', url: '', tag_list: '')
      expect(mix).not_to be_valid
    end
  end
end
