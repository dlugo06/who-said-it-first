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
    JSON.parse(res.body)
  end

  def self.search_get(params)
    @uri = Musixmatch.build_uri(TRACK_SEARCH, params)
    @results = Musixmatch.data_pull(@uri)
    Musixmatch.count_results(@results, @uri)
  end

  private
  def self.build_uri(api_call, params)
    BASE_URI + api_call + '?q_lyrics=' + params['lyrics'] + '&apikey=' + API_KEY + '&page_size=100'
  end

  def self.count_results(results, uri)
    num_results = results['message']['body']['track_list'].count.to_i
    total_results = results['message']['header']['available']
    if num_results < total_results
      true
    else
      false
      #   num_pages = (total_results.to_f/num_results).ceil
      # (2..num_pages).each do |n|
      #     remaining_results = Musixmatch.data_pull("#{uri}&page=#{n}")
      #     print_names(remaining_results)
      # end
    end
  end
end
