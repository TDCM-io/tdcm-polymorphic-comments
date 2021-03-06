class CommentsController < ApplicationController
  before_action :set_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable unless @commentable.is_a?(Comment)
      redirect_to @commentable.find_parent if @commentable.is_a?(Comment)
      flash[:notice] = 'Comment created'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = 'Comment deleted'
    else
      flash[:alert] = 'Smth went wrong'
    end
    redirect_to @commentable unless @commentable.is_a?(Comment)
    redirect_to @commentable.find_parent if @commentable.is_a?(Comment)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
