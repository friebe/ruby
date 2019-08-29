class CommentsController < ApplicationController

  def index
    @comments = Comment.new
  end

  def new
    @comments = Comment.new
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)

   if @comment.save
     redirect_to project_path(@project)
   else
     # redirect_to project_path(@project)
     render 'projects/show'
   end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end