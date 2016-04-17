class CommentsController < ApplicationController

	def new
    @post = Post.find_by_id(params[:id])
		@comment_new = @post.comments.build
	end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to '/posts'
    else
      render :new
    end
  end


  def edit
  	@comment = get_comment
    @comment.update(comment_params)
    redirect_to '/posts'
  end

  def update
  	@comment = get_post
    @comment.update(comment_params)
    if @comment.save
      flash[:notice] = "Your comment was successfully updated"
      redirect_to '/posts'
    else
      flash[:alert] = "There was an error changing your comment."
      redirect_to '/posts'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      flash[:notice] = "Comment was removed"
      redirect_to '/posts'
    else
      flash[:notice] = "There was an error removing comment"
      redirect_to '/posts'
    end
  end



   private

   def comment_params
        params.require(:comment).permit(:user_id, :post_id, :message)
   end

end
