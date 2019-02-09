class MixesController < ApplicationController

  before_action :find_mix, only: [:edit, :update, :destroy]

  def index
    @mixes = Mix.all
  end

  def new
    @mix = Mix.new
  end

  def create
    @mix = Mix.create(mix_params)

    redirect_to "/"
  end

  def destroy
    @mix.destroy

    redirect_to "/"
  end

  def edit
  end

  def update
    @mix.update_attributes(mix_params)

    redirect_to "/"
  end

  private

  def mix_params
    params.require(:mix).permit(:name, :url, :tag_list)
  end

  def find_mix
    @mix = Mix.find(params[:id])
  end
end
