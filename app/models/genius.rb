class Genius < ApplicationRecord
  @redirect = 'http://localhost:3000/oauth2/callback.json'

  def self.auth_page
    "https://api.genius.com/oauth/authorize?client_id=#{self.client_id}&redirect_uri=#{@redirect}&state=1&response_type=code"
  end

  def self.get_auth_token(code)
    client = OAuth2::Client.new(client_id, client_secret, site: 'https://api.genius.com')
    client.auth_code.get_token(code, :redirect_uri => @redirect, :headers => {client_id: client_id, client_secret: client_secret, response_type: 'code', grant_type: 'authorization_code'})
  end

  def self.get_annotation(token)
    token.get('https://api.genius.com/songs/378195')
  end

  private
  def self.client_id
    ENV['CLIENT_ID']
  end

  def self.client_secret
    ENV['CLIENT_SECRET']
  end
end
