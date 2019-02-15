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
      it 'redirects to mixes path' do
        expect(create_valid_mix_action).to redirect_to mixes_path
      end

      it 'creates a mix in the db' do
        expect { create_valid_mix_action }.to change { Mix.count }.by(1)
      end
    end
    context 'with invalid params' do
      it 'renders new template' do
        expect(create_invalid_mix_action).to render_template :new
      end
    end
  end

  context 'with a mix in the db' do
    before do
      @mix = Mix.create(name: 'test', url: 'blah.com', tag_list: 'techno')
    end
    describe 'DELETE destroy' do
      it 'redirects to mixes path' do
        delete :destroy, params: { id: @mix.id }
        expect(response).to redirect_to mixes_path
      end
      it 'deletes mix from db' do
        expect { delete :destroy, params: { id: @mix.id } }.to change { Mix.count }.by(-1)
      end
    end

    describe 'GET edit' do
      it 'returns a 200' do
        get :edit, params: { id: @mix.id }
        expect(response).to have_http_status(200)
      end
    end

    describe 'PATCH update' do
      it 'redirects to mixes path' do
        patch :update, params: { id: @mix.id, mix: { mix: { name: 'house mix', url: 'blach.com', tag_list: 'house, techno' } } }
        expect(response).to redirect_to mixes_path
      end
    end
  end
end
