class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:title)
    @task = Task.new task_params
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find params[:id]
    @comment = Comment.new
  end

end
