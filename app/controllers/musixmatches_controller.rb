class MusixmatchesController < ApplicationController
  def index
  end

  def show
  end

  def search
    @result = Musixmatch.search_get(musix_params)
    @musix_results = []
    @result['message']['body']['track_list'].each do |track|
      track = track['track']
      @musix = Musixmatch.new
      unless track['first_release_date'].blank?
        @musix.release_date = track['first_release_date'].to_date
        @musix.song_name = track['track_name']
        @musix.album_name = track['album_name']
        @musix.artist_name = track['artist_name']
        @musix_results << @musix
      end
    end

    @musix_results# = Musixmatch.where(id: @musix_results.map(&:id))
  end

  private
  def musix_params
    params.fetch(:musix, {})
  end
end
