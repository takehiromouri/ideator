class IdeasController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index		
		@ideas = Idea.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)		
	end

	def create		
		@idea = current_user.ideas.new(idea_params)

		if @idea.save
			flash[:success] = "Your idea has been posted!"
		else
			flash[:alert] = @idea.errors.full_messages[0]
		end

		redirect_to root_path
	end

	def edit
		@idea = current_idea
	end

	def update
		@idea = current_idea
		if @idea.update(idea_params)
			flash[:success] = "Your idea has been updated!"
			redirect_to root_path
		else
			flash[:alert] = @idea.errors.full_messages[0]
			redirect_to edit_idea_path(params[:id])
		end
	end

	def destroy
		@idea = current_idea
		@idea.destroy
		redirect_to root_path
	end

	private

	def current_idea
		@idea ||= Idea.find(params[:id])
	end

	def idea_params
		params.require(:idea).permit(:description, :author)		
	end
end
