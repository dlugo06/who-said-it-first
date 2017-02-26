class Musixmatch < ApplicationRecord
  BASE_URI = 'https://api.musixmatch.com/ws/1.1/'
  API_KEY = ENV['MUSIXMATCH_KEY']
  TRACK_SEARCH = 'track.search'


  def self.data_pull(uri)
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    req = Net::HTTP::Get.new(url.to_s)
    res = http.start{|https| https.request(req)}
    res.body
  end

  def self.search_get(params)
    @uri = Musixmatch.build_uri(TRACK_SEARCH, params)
    Musixmatch.data_pull(@uri)
  end

  def self.lyrics_get

  end

  private
  def self.build_uri(api_call, params)
    BASE_URI + api_call + '?q_lyrics=' + params['lyrics'] + '&apikey=' + API_KEY
  end
end
