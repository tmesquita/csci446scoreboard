class HighscoreController < ApplicationController
	respond_with :html, :xml, :json

	def index
		respond_with(@scores = Highscore.all)
	end

	def create
		@score = Highscore.new(params[:score])
		respond_with(@score, :location => root_url)
	end
end
