class ResultsController < ApplicationController

  def show
    @code = params['code']
    @result = Genius.get_annotation(Genius.get_auth_token(@code))
  end
end
