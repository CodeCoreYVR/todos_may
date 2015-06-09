class CommentsController < ApplicationController

  def create
    @task          = Task.find params[:task_id]
    comment_params = params.require(:comment).permit(:body)
    @comment       = Comment.new comment_params
    @comment.task  = @task
    if @comment.save
      redirect_to task_path(@task),notice: "comment created"
    else
      render "/tasks/show"
    end
  end
end
