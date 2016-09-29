class IdeasController < ApplicationController
	def index		
		@ideas = Idea.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def create		
		@idea = Idea.create(params[:idea])
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
