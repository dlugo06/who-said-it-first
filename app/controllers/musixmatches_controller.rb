class MusixmatchesController < ApplicationController
  def index
  end

  def show
  end

  def search
    @result = Musixmatch.search_get(musix_params)
    # Musixmatch.count_results(@result)
    render json: @result
  end

  private
  def musix_params
    params.fetch(:musix, {})
  end
end
