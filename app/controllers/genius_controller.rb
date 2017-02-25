class GeniusController < ApplicationController
  # POST /authorize
  def authorize
    @auth_page = Genius.auth_page
    redirect_to @auth_page
  end

  # GET /authenticate
  def auth_page
    # @genius = Genius.new
  end

  def show
    @code = params['code']
    @result = Genius.get_annotation(Genius.get_auth_token(@code)).parsed
    respond_to do |format|
      format.json { render :show }
    end
  end

  def new
    @genius = Genius.new
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.fetch(:genius, {})
    end
end
