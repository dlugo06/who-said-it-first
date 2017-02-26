class MusixmatchesController < ApplicationController
  def index

  end

  def show

  end

  def search
    @result = Musixmatch.search_get(musix_params)
    redirect_to musix_show_path(@result)
  end

  private
  def musix_params
    params.fetch(:musix, {})
  end
end
