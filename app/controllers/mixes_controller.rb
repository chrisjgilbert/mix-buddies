class MixesController < ApplicationController
  def index
    @mixes = Mix.all
  end

  def new
    @mix = Mix.new
  end

  def create
    @mix = Mix.create(mix_params)
    @mix.save
    redirect_to "/"
  end

  def destroy
    mix = Mix.find(params[:id])
    mix.destroy
    redirect_to "/"
  end

  private

  def mix_params
    params.require(:mix).permit(:name, :url, :tag_list)
  end
end
