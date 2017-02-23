class Genius < ApplicationRecord
  def self.get_auth_token
    client_id = ENV['CLIENT_ID']
    client_secret = ENV['CLIENT_SECRET']
    client = OAuth2::Client.new(client_id, client_secret, site: "https://api.genius.com/oauth/authorize")
    url = client.auth_code.authorize_url
    binding.pry

    client.auth_code.get_token(url)
  end

  def self.get_annotation(token)
    token.get('api.genius.com/annotations/10225840', :params => { 'query_foo' => 'bar' })
  end
end
