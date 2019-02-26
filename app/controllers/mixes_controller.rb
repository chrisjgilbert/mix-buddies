# frozen_string_literal: true

class MixesController < ApplicationController
  before_action :find_mix, only: [:show, :edit, :update, :destroy]

  def index
    if params[:tag]
      @mixes = Mix.tagged_with(params[:tag])
    else
      @mixes = Mix.all
    end
  end

  def new
    @mix = Mix.new
  end

  def create
    @mix = Mix.create(mix_params)
    @mix.user_id = current_user.id
    if @mix.save
      redirect_to mixes_path
    else
      render 'new'
    end
  end

  def destroy
    @mix.destroy

    redirect_to mixes_path
  end

  def edit
  end

  def update
    @mix.update_attributes(mix_params)

    redirect_to mixes_path
  end

  private

  def mix_params
    params.require(:mix).permit(:name, :url, :tag_list)
  end

  def find_mix
    @mix = Mix.find(params[:id])
  end
end
