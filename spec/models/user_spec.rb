require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    it 'creates with valid attributes' do
      user = User.create(first_name: 'chris', last_name: 'gilbert', email: 'chris@gilbert.com', password: 'secret', password_confirmation: 'secret')
      expect(user).to be_valid
    end

    it 'does not create with invalid attributes' do
      user = User.create(first_name: nil, last_name: nil, email: nil, password: nil, password_confirmation: nil)
      expect(user).not_to be_valid
    end
  end
end
