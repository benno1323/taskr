class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to @task, notice: 'Task created successfully!'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:subject, :description, :priority)
  end
end
