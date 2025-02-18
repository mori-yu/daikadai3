class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def new
   @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    @user = User.find(current_user.id)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path, notice: "トピックを作成しました！"
      NoticeMailer.sendmail_topic(@topic,@user).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topics_params)
      redirect_to topics_path, notice: "トピックを更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "トピックを削除しました！"
  end

  private
  def topics_params
    params.require(:topic).permit(:title, :content)
  end

  def set_topic
      @topic = Topic.find(params[:id])
    end
end
