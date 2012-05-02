class HighscoresController < ApplicationController
	skip_before_filter :verify_authenticity_token

	respond_to :json

	def index
		respond_with(@scores = Highscore.all)
	end

	def create
		@score = Highscore.new(:name => params[:name], :score => params[:score])
		
		respond_to	do |format| 
			if @score.save
				format.json { render :json => @score, :status => :created, :location => @score }
			end
		end
		
		#respond_with(@score)
	end
end
