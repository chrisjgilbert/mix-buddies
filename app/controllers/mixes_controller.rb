class MixesController < ApplicationController

  before_action :find_mix, only: [:edit, :update, :destroy]

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

    redirect_to "/"
  end

  def destroy
    @mix.destroy

    respond_to do |format|
     format.html { redirect_to mixes_url }
     format.json { head :no_content }
     format.js   { render :layout => false }
    end

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
