class IdeasController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index		
		@ideas = Idea.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def create		
		@idea = current_user.ideas.new(params[:idea])

		if @idea.save
			flash[:success] = "Your idea has been posted!"
		else
			flash[:alert] = "Woops! Looks like there's an error!"			
		end

		redirect_to root_path
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:id])
		if @idea.update(idea_params)
			redirect_to root_path
		else
			redirect_to edit_idea_path(params[:id])
		end
	end

	def destroy
		@idea = Idea.find(params[:id])
		@idea.destroy
		redirect_to root_path
	end

	def random
		@idea = Idea.order("RANDOM()").first
	end

	private

	def idea_params
		params.require(:idea).permit(:description, :author)		
	end
end
