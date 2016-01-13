class IdeasController < ApplicationController
	def index
		@ideas = Idea.order("created_at DESC")
	end

	def new
		@idea = Idea.new
	end

	def create
		@idea = Idea.create(idea_params)
		redirect_to root_path
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:id])
	end

	def show
		@idea = Idea.find(params[:id])
	end

	def about

	end

	private

	def idea_params
		params.require(:idea).permit(:description, :author)		
	end
end
