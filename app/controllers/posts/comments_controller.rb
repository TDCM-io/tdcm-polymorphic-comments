module Posts
  class CommentsController < CommentsController

    def new
      @comment = Comment.new
    end

    private

    def set_commentable
      @commentable = Post.find(params[:post_id])
    end
  end
end
