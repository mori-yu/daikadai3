class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    #respond_to do |format|
        if @comment.update(comment_params)
          #format.html {
          redirect_to topic_path(@comment.topic), notice:"コメントを編集しました!"
        else
          render 'edit'
        end
   # end
  end
      
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html {redirect_to topics_path(@topic)}
          flash.now[:notice] = "コメントが削除されました!"
        format.js { render :index }
    end
  end
  
  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
  end
