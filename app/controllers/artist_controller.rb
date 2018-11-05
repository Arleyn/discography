class ArtistController < ApplicationController

	def dashboard
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create 
	    @artist = Artist.new(artist_params)
	    if @artist.save
	    	redirect_to artist_dashboard_path
	    else
	    	render :new
	    end
	end

	def edit 
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])

    	Artist.transaction do
	    	if @artist.update_attributes(artist_params)
	        	redirect_to artist_dashboard_path
	    	else
	    		render :edit
	      	end
	    end
    end

	def delete 
		artist = Artist.find(params[:id])
		artist.destroy
		redirect_to artist_dashboard_path
	end

	private

	def artist_params
    	params.require(:artist).permit(:name,
                                   :description)
  	end
end
