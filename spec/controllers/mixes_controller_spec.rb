# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MixesController, type: :controller do

  describe 'GET index' do
    it 'returns a 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET new' do
    it 'returns a 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'redirects to `/`' do
        post :create, params: { mix: { name: 'house mix', url: 'blach.com', tag_list: 'house, techno' } }
        expect(response).to redirect_to '/'
      end
    end
    context 'with invalid params' do
      it 'renders new template' do
        post :create, params: { mix: { name: '', url: '', tag_list: '' } }
        expect(response).to render_template :new
      end
    end

    describe 'DELETE destroy' do
      before do
        @mix = Mix.create(name: 'test', url: 'blah.com', tag_list: 'techno')
      end
      it 'redirects to `/`' do
        delete :destroy, params: { id: @mix.id }
      end
      it 'deletes mix from db' do
        expect { delete :destroy, params: { id: @mix.id } }.to change { Mix.count }.by(-1)

      end
    end
  end

end
