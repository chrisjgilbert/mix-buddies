class MixesController < ApplicationController
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
    Mix.destroy(params[:id])

    redirect_to "/"
  end

  def edit
    @mix = Mix.find(params[:id])
  end

  def update
    @mix = Mix.find(params[:id])
    @mix.update_attributes(mix_params)

    redirect_to "/"
  end

  private

  def mix_params
    params.require(:mix).permit(:name, :url, :tag_list)
  end
end
