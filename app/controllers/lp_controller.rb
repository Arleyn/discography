class LpController < ApplicationController

	def dashboard
		@lps = Lp.where(artist_id: params[:id_artist])
		@artist_id = params[:id_artist]
	end

	def dashboard_filter
		@lps = Lp.all
	end

	def dashboard_filter_result
		@artist_id = params[:artist][:artist]
		@lps = Lp.where(artist_id: @artist_id)
		render 'dashboard_filter'
	end

	def new
		@lp = Lp.new
		@artist_id = params[:id_artist]
	end

	def create
		@lp = Lp.new(lp_params)
		@lp.artist_id = params[:id_artist]
	    if @lp.save
	    	redirect_to lp_dashboard_path
	    else
	    	render :new
	    end
	end

	def edit
		@lp = Lp.find(params[:id])
		@artist_id = params[:id_artist]
	end

	def update
		@lp = Lp.find(params[:id])
		puts params[:id_artist]
		@lp.artist_id = params[:id_artist]

    	Lp.transaction do
	    	if @lp.update_attributes(lp_params)
	        	redirect_to lp_dashboard_path
	    	else
	    		render :edit
	      	end
	    end
	end

	def delete
		lp = Lp.find(params[:id])
		lp.destroy
		redirect_to lp_dashboard_path
	end

	private

	def lp_params
    	params.require(:lp).permit(:name,
                                   :description)
  	end
end
